import 'package:flutter/material.dart';
import 'package:par_tamil/constants/colors.dart';
import 'package:typewritertext/typewritertext.dart';

import '../routes/start.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/use/111111.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // backgroundColor: Colors.white,

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,


        floatingActionButton:

        Container(

          height: 50,
          color: ColorsFile.cc,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              print("--LETS GO PRESSED --------");

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
                (e) => false,
              );
            },
            child: const Center(
              child: Text(
                "Let's go",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsFile.cc,
                            fontSize: 40,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                          Text(
                                "VITians!",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorsFile.cc,
                                  fontSize: 40,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),

                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Image.asset(
                              "assets/images/onboarding/wave.gif",
                              height: 50.0,
                              width: 50.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Your own friendly neighbourhood",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            Text(
                              " LANGUAGE COMPANION.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.lightGreen.shade200,
                            border: Border.all(
                                color: Colors.lightGreen.shade200,
                                width: 5.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        width: 140,
                        height: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.translate,
                              size: 50,
                              color: Colors.black,
                            ),
                            Text(
                              "TRANSLATE",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.purple.shade100,
                            border: Border.all(
                                color: Colors.purple.shade100,
                                width: 5.0,
                                style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: 140,
                        height: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 50,
                            ),
                            Text(
                              "SCAN",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            border: Border.all(
                                color: Colors.pink.shade100,
                                width: 5.0,
                                style: BorderStyle.solid),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: 140,
                        height: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.menu_book_sharp,
                              size: 50,
                              color: Colors.black,
                            ),
                            Text(
                              "LEARN",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
