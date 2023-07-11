
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:par_tamil/constants/colors.dart';
import 'package:par_tamil/onboard/welcome.dart';
import 'package:par_tamil/routes/home.dart';
import 'package:par_tamil/routes/start.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAR Tamil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.transparent,
        primaryColor: ColorsFile.cc,
        textTheme: GoogleFonts.latoTextTheme(),),
      home: const Welcome(),
      builder: EasyLoading.init(),
    );
  }
}
