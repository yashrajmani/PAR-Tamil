import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:par_tamil/routes/scan.dart';
import 'package:translator/translator.dart';

import '../constants/colors.dart';
import '../voiceget.dart';

class Trans extends StatefulWidget {
  const Trans({Key? key}) : super(key: key);

  @override
  State<Trans> createState() => _Trans();
}

class _Trans extends State<Trans> {
  GoogleTranslator translator = GoogleTranslator(); //using google translator
  FlutterTts flutterTts = FlutterTts();

  initSpeak() async {
    FlutterTts flutterTts = FlutterTts();
    GoogleTranslator translator = GoogleTranslator();
  }

  @override
  void initState() {
    initSpeak();
    super.initState();
  }

  String out1 = 'Tamil translation here.';
  String out2 = 'Hindi translation here.';
  final sent = TextEditingController(); //getting text

  void transt() {
    translator.translate(sent.text, to: 'ta').then((output) {
      setState(() {
        out1 = output
            .toString(); //placing the translated text to the String to be used
      });
      print(out1);
    });

    translator.translate(sent.text, to: 'hi').then((output) {
      setState(() {
        out2 = output
            .toString(); //placing the translated text to the String to be used
      });
      print(out2);
    });

    EasyLoading.showSuccess('Done!');
    EasyLoading.dismiss();
  }

  Future speakhindi(String word) async {
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.setSpeechRate(0.75);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(word);
  }

  Future speaktamil(String word) async {
    await flutterTts.setLanguage("ta-IN");
    await flutterTts.setSpeechRate(0.75);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(word);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          title: const Text(
            "Translate",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),


                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: sent,
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    style: const TextStyle(
                      color: ColorsFile.colorblack,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter here in English",
                      contentPadding: const EdgeInsets.only(left: 20),
                      fillColor: ColorsFile.colorwhite,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.002,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 5.0)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.0, 1.0],
                        colors: [
                          Colors.deepPurple.shade600,
                          Colors.deepPurple.shade200,
                        ],
                      ),
                      color: Colors.deepPurple.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(60, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        EasyLoading.show(status: 'Translating...');
                        transt();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const
                              Text(
                                'Translate',
                                style: TextStyle(fontSize: 16),
                              ),


                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.005,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),

                // Text(
                //   "TAMIL:",
                //   style: TextStyle(fontSize: 16, color: Colors.red),
                // ),


                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: ColorsFile.cc,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              out1.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: out1))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Tamil : Copied to clipboard!")));
                                });
                              },
                              icon: Icon(
                                Icons.copy,
                                color: ColorsFile.colorwhite,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                /// translated string
                // Text(
                //   "HINDI:",
                //   style: TextStyle(fontSize: 16, color: Colors.red),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.002,
                ),

                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: ColorsFile.cc,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              out2.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: out2))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Hindi : Copied to clipboard!")));
                                });
                              },
                              icon: Icon(
                                Icons.copy,
                                color: ColorsFile.colorwhite,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 150,
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 5.0)
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topRight,
                            stops: [0.0, 1.0],
                            colors: [
                              Colors.deepPurple.shade600,
                              Colors.deepPurple.shade200,
                            ],
                          ),
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            minimumSize:
                            MaterialStateProperty.all(Size(20, 50)),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                            // elevation: MaterialStateProperty.all(3),
                            shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () => speakhindi(out1.toString()),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Speak Tamil',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.02,
                                ),
                                Icon(
                                  Icons.volume_up,
                                  size: 22,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 150,
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 5.0)
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
                            colors: [
                              Colors.deepPurple.shade600,
                              Colors.deepPurple.shade200,
                            ],
                          ),
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            minimumSize:
                            MaterialStateProperty.all(Size(20, 50)),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                            // elevation: MaterialStateProperty.all(3),
                            shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () => speakhindi(out2.toString()),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Speak Hindi',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.02,
                                ),
                                Icon(
                                  Icons.volume_up,
                                  size: 22,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


                /// translated string
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
