import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:par_tamil/constants/colors.dart';
import 'package:par_tamil/routes/scan.dart';

import '../components/message.dart';
import '../voiceget.dart';

class Bot extends StatefulWidget {
  const Bot({Key? key}) : super(key: key);

  @override
  State<Bot> createState() => _BotState();
}

class _BotState extends State<Bot> {
  late DialogFlowtter dialogFlowtter;

  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,

      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/images/use/bgimg.png"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/use/22.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffffffff),
              Color(0xCCdc9cfd),
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "PAR-Bot",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.add_a_photo_outlined,
                size: 30,
              ),
              tooltip: ' SCAN ',
              onPressed: () {
                print("SCAN PRESSED ------");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scan()),
                );
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.record_voice_over,
                  size: 30,
                ),
                tooltip: ' VOICE ',
                onPressed: () {
                  print("VOICE PRESSED ------");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VoiceCheck()),
                  );
                },
              ), //
            ],
            elevation: 8,
            backgroundColor: Colors.black,
          ), //AppBar

          body: Column(
            children: [
              Expanded(
                  child: Container(child: MessagesScreen(messages: messages))),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                child: Container(

                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(

                          hintText: "Enter message in Tamil/English",
                          contentPadding: const EdgeInsets.only(left: 20),
                          fillColor: ColorsFile.colorwhite,
                          filled: true,

                          focusedBorder:OutlineInputBorder(
                            borderSide: const BorderSide(color: ColorsFile.cc, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),


                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 0.07,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipOval(
                          child: Material(
                            color: ColorsFile.cc, // Button color
                            child: InkWell(
                              splashColor: Colors.white, // Splash color
                              onTap: () {
                                sendMessage(_controller.text);
                                _controller.clear();
                              },
                              child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
