import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:par_tamil/routes/scan.dart';
import 'package:translator/translator.dart';

import '../constants/colors.dart';
import '../voiceget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
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

  String english = 'Hello';

  String tamil = 'வணக்கம்';

  Future speak(String word, String lang) async {
    await flutterTts.setLanguage(lang);
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
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          title: const Text(
            "Home",
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
                Container(
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          // Text(
                          //   " Welcome!",
                          //   style: GoogleFonts.lato(
                          //       fontSize: 24,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.w400),
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Image.asset(
                            'assets/images/use/clg.png',
                            width: 280,
                            height: 280,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // COLOR CHANGE-----------------------

                SizedBox(
                  height: 340,
                  child: Container(



                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xCCdc9cfd),
                          Colors.black12,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [


                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          " Let’s learn a new word !",
                          style: GoogleFonts.lato(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(

                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
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
                                          Colors.deepPurple.shade200,
                                          Colors.deepPurple.shade600,
                                        ],
                                      ),
                                      color: Colors.deepPurple.shade300,
                                      borderRadius:
                                      BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            SizedBox(
                                              width: 80,
                                            ),

                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  tamil.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 22),
                                                ),
                                                Text(
                                                  english.toString(),
                                                  style: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontSize: 22),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              width: 50,
                                            ),


                                            IconButton(onPressed: (){


                                              speak(tamil, 'ta-IN');






                                            }, icon: Icon(Icons.volume_up,size: 40,color: Colors.white,),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                // Padding(
                                //   padding: const EdgeInsets.all(10.0),
                                //   child: Container(
                                //     width: 150,
                                //     height: 70,
                                //     decoration: BoxDecoration(
                                //       boxShadow: [
                                //         BoxShadow(
                                //             color: Colors.black26,
                                //             offset: Offset(0, 4),
                                //             blurRadius: 5.0)
                                //       ],
                                //       gradient: LinearGradient(
                                //         begin: Alignment.topLeft,
                                //         end: Alignment.bottomRight,
                                //         stops: [0.0, 1.0],
                                //         colors: [
                                //           Colors.deepPurple.shade200,
                                //           Colors.deepPurple.shade600,
                                //         ],
                                //       ),
                                //       color: Colors.deepPurple.shade300,
                                //       borderRadius:
                                //           BorderRadius.circular(100),
                                //     ),
                                //     child: ElevatedButton(
                                //       style: ButtonStyle(
                                //         shape: MaterialStateProperty.all<
                                //             RoundedRectangleBorder>(
                                //           RoundedRectangleBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(20.0),
                                //           ),
                                //         ),
                                //         minimumSize:
                                //             MaterialStateProperty.all(
                                //                 Size(60, 50)),
                                //         backgroundColor:
                                //             MaterialStateProperty.all(
                                //                 Colors.transparent),
                                //         // elevation: MaterialStateProperty.all(3),
                                //         shadowColor:
                                //             MaterialStateProperty.all(
                                //                 Colors.transparent),
                                //       ),
                                //       onPressed: () =>
                                //           speak(tamil, 'ta-IN'),
                                //       child: Padding(
                                //         padding: const EdgeInsets.only(
                                //           top: 10,
                                //           bottom: 10,
                                //         ),
                                //         child: Icon(
                                //           Icons.volume_up,
                                //           size: 22,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),


                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
