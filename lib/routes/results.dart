import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:par_tamil/constants/colors.dart';
import 'package:par_tamil/routes/home.dart';
import 'package:par_tamil/routes/start.dart';
import 'package:translator/translator.dart';

class Results extends StatefulWidget {
  Results({
    Key? key,
    required this.res,
    required this.singleline,
    required this.lines,
    required this.eng,
    required this.hin,
  });
  String res = "";
  String singleline = "";
  String eng = "";
  String hin = "";
  String lines = "";

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
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

  Future speak(String word, String lang, var speed) async {
    await flutterTts.setLanguage(lang);
    await flutterTts.setSpeechRate(speed);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(word);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              'Image Translator',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 8,
            backgroundColor: Colors.black,
          ), //AppBar

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  "Text Recognised:",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              widget.res,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.volume_up,
                                  size: 40,
                                ),
                                onPressed: () => speak(
                                    widget.singleline.toString(),
                                    'ta-IN',
                                    0.75)),
                            SizedBox(
                              width: 0.005,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                Text(
                  "Results:",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: Colors.black),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                // Text(
                //   widget.singleline,
                //   style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 20,
                //       color: Colors.black),
                // ),
                // Text(
                //   widget.lines,
                //   style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 20,
                //       color: Colors.black),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Container(
                //     width: 150,
                //     height: 50,
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
                //           Colors.redAccent,
                //           Colors.deepPurple,
                //         ],
                //       ),
                //       color: Colors.deepPurple.shade300,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: ElevatedButton(
                //       style: ButtonStyle(
                //         shape:
                //             MaterialStateProperty.all<RoundedRectangleBorder>(
                //           RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(20.0),
                //           ),
                //         ),
                //         minimumSize: MaterialStateProperty.all(Size(20, 50)),
                //         backgroundColor:
                //             MaterialStateProperty.all(Colors.transparent),
                //         // elevation: MaterialStateProperty.all(3),
                //         shadowColor:
                //             MaterialStateProperty.all(Colors.transparent),
                //       ),
                //       onPressed: () =>
                //           speak(widget.singleline.toString(), 'ta-IN', 0.75),
                //       child: Padding(
                //         padding: const EdgeInsets.only(
                //           top: 10,
                //           bottom: 10,
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             const Text(
                //               'Tamil',
                //               style: TextStyle(fontSize: 16),
                //             ),
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width * 0.02,
                //             ),
                //             Icon(
                //               Icons.volume_up,
                //               size: 22,
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
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
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              "' " + widget.eng + " '",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.volume_up,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                onPressed: () => speak(
                                    widget.eng.toString(), 'en-IN', 0.75)),
                            SizedBox(
                              width: 0.005,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //
                // Text(
                //   "' " + widget.eng + " '",
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 24,
                //       color: Colors.black),
                // ),
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
                //           Colors.deepPurple.shade600,
                //           Colors.deepPurple.shade200,
                //         ],
                //       ),
                //       color: Colors.deepPurple.shade300,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: ElevatedButton(
                //       style: ButtonStyle(
                //         shape:
                //             MaterialStateProperty.all<RoundedRectangleBorder>(
                //           RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(20.0),
                //           ),
                //         ),
                //         minimumSize: MaterialStateProperty.all(Size(20, 50)),
                //         backgroundColor:
                //             MaterialStateProperty.all(Colors.transparent),
                //         // elevation: MaterialStateProperty.all(3),
                //         shadowColor:
                //             MaterialStateProperty.all(Colors.transparent),
                //       ),
                //       onPressed: () =>
                //           speak(widget.eng.toString(), 'en-IN', 0.70),
                //       child: Padding(
                //         padding: const EdgeInsets.only(
                //           top: 10,
                //           bottom: 10,
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             const Text(
                //               'English',
                //               style: TextStyle(fontSize: 16),
                //             ),
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width * 0.02,
                //             ),
                //             Icon(
                //               Icons.volume_up,
                //               size: 22,
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
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
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              "' " + widget.hin + " '",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.volume_up,
                                size: 40,
                                color: Colors.white,
                              ),
                              onPressed: () =>
                                  speak(widget.hin.toString(), 'hi-IN', 0.75),
                            ),
                            SizedBox(
                              width: 0.005,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Text(
                //   "' " + widget.hin + " '",
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 24,
                //       color: Colors.black),
                // ),
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
                //           Colors.deepPurple.shade600,
                //           Colors.deepPurple.shade200,
                //         ],
                //       ),
                //       color: Colors.deepPurple.shade300,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: ElevatedButton(
                //       style: ButtonStyle(
                //         shape:
                //             MaterialStateProperty.all<RoundedRectangleBorder>(
                //           RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(20.0),
                //           ),
                //         ),
                //         minimumSize: MaterialStateProperty.all(Size(20, 50)),
                //         backgroundColor:
                //             MaterialStateProperty.all(Colors.transparent),
                //         // elevation: MaterialStateProperty.all(3),
                //         shadowColor:
                //             MaterialStateProperty.all(Colors.transparent),
                //       ),
                //       onPressed: () =>
                //           speak(widget.hin.toString(), 'hi-IN', 0.75),
                //       child: Padding(
                //         padding: const EdgeInsets.only(
                //           top: 10,
                //           bottom: 10,
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             const Text(
                //               'Hindi',
                //               style: TextStyle(fontSize: 16),
                //             ),
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width * 0.02,
                //             ),
                //             Icon(
                //               Icons.volume_up,
                //               size: 22,
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        print("--START OVER---");

                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'START OVER',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Icon(
                            Icons.refresh,
                            size: 25,
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        elevation: 5,
                        primary: ColorsFile.cc,
                        shadowColor: ColorsFile.timecolor,
                      ),
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
