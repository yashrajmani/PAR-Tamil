import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:par_tamil/components/containers.dart';
import 'package:par_tamil/constants/colors.dart';
import 'package:par_tamil/routes/extra.dart';
import 'package:par_tamil/routes/scan.dart';

import '../voiceget.dart';
import 'learnmore/learnmore.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  State<Learn> createState() => _Learn();
}

class _Learn extends State<Learn> {
  List<bool> _isExpanded = List.generate(10, (_) => false);
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
        appBar: AppBar(
          title: const Text(
            "Learn",
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

        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.03,
            // ),

            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Learn",
            //       style: GoogleFonts.lobster(
            //           fontSize: 38,
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     SizedBox(
            //       height: MediaQuery.of(context).size.height * 0.001,
            //     ),
            //
            //
            //     Text(
            //       "அறிய",
            //       style: GoogleFonts.greatVibes(
            //           fontSize: 22,
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold),
            //     ),
            //
            //
            //   ],
            // ),
            // Divider(
            //   thickness: 5,
            //   endIndent: 20,
            //   indent:20,
            //   color: ColorsFile.colorpurple,
            // ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'assets/images/use/h2.png',
                    //   width: 200,
                    //   height: 250,
                    // ),
                    Container(
                      child: ExpansionPanelList(
                        expansionCallback: (index, isExpanded) => setState(() {
                          _isExpanded[index] = !isExpanded;
                        }),
                        children: [
                          for (int i = 0; i < 1; i++)
                            ExpansionPanel(
                              body: ListTile(
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Tamil (தமிழ்) is a Dravidian language natively spoken by the Tamil people of South Asia. Tamil is an official language of the Indian state of Tamil Nadu, the sovereign nations of Sri Lanka and Singapore,and the Indian territory of Puducherry. Tamil is also spoken by significant minorities in the four other South Indian states of Kerala, Karnataka, Andhra Pradesh and Telangana, and the Union Territory of the Andaman and Nicobar Islands. It is also spoken by the Tamil diaspora found in many countries, including Malaysia, Myanmar, South Africa, United Kingdom, United States, Canada, Australia and Mauritius. Tamil is also natively spoken by Sri Lankan Moors. One of 22 scheduled languages in the Constitution of India, Tamil was the first to be classified as a classical language of India.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              headerBuilder: (_, isExpanded) {
                                return Center(
                                  child: Text(
                                    "Know more about Tamil!",
                                    style: GoogleFonts.lato(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                );
                              },
                              isExpanded: _isExpanded[i],
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnMore(
                                          titletext: 'Numbers',
                                          learnimg: 'num',
                                          imgno: '6',
                                        )),
                              );
                              print("----------- 2 NUM------");
                            },
                            child: ContainerB(title: "Numbers", imgno: "6"),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnMore(
                                      titletext: 'Alphabets',
                                      learnimg: 'alpha',
                                      imgno: '7',
                                    )),
                              );
                              print("----------- alpha ------");
                            },
                            child: ContainerB(title: "Alphabets", imgno: "7"),
                          ),
                        ),
                      ],
                    ),





                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LearnMore(
                                            titletext: 'Basic Words',
                                            learnimg: 'basic',
                                            imgno: '1',
                                          )),
                                );
                                print("----------- 1 CICKED------");
                              },
                              child: ContainerB(title: "Basic Words", imgno: "1")),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnMore(
                                      titletext: 'Greeting Words',
                                      learnimg: 'greeting',
                                      imgno: '2',
                                    )),
                              );
                              print("----------- 2 CICKED------");
                            },
                            child: ContainerB(title: "Greeting Words", imgno: "2"),
                          ),
                        ),

                      ],
                    ),




                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnMore(
                                          titletext: 'Daily Use Words',
                                          learnimg: 'daily',
                                          imgno: '3',
                                        )),
                              );
                              print("----------- 3 CICKED------");
                            },
                            child: ContainerB(title: "Daily Use Words", imgno: "3"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearnMore(
                                      titletext: "Traveler's Words",
                                      learnimg: 'travel',
                                      imgno: '4',
                                    )),
                              );
                              print("----------- 4 CICKED------");
                            },
                            child: ContainerB(
                                title: "Traveler Words", imgno: "4"),
                          ),
                        ),


                      ],
                    ),

                    //
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => LearnMore(
                    //                 titletext: 'Family/Relation Words',
                    //                 learnimg: 'fam',
                    //                 imgno: '5',
                    //               )),
                    //     );
                    //     print("----------- 5 CICKED------");
                    //   },
                    //   child: ContainerB(
                    //       title: "Family/Relation Words", imgno: "5"),
                    // ),


                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
