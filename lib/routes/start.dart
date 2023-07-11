import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:par_tamil/constants/colors.dart';
import 'package:par_tamil/routes/scan.dart';
import 'package:par_tamil/routes/home.dart';
import 'package:par_tamil/routes/translate.dart';
import 'package:par_tamil/routes/learn.dart';
import 'package:translator/translator.dart';

import 'extra.dart';

void main() => runApp(const MyHomePage());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int _selectedIndex = 0;

  //
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Trans(),
    Learn(),
    Bot()
  ];

// void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

  // var _selectedTab = _SelectedTab.Home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedIndex = i;
      // _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  void initState() {
    GoogleTranslator translator = GoogleTranslator();
    FlutterTts flutterTts = FlutterTts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exit(context),
      child: SafeArea(
        child: Container(
          color: Colors.white,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/use/bgimg.png"),
          //     fit: BoxFit.cover,
          //   ),
          // ),

          child: Scaffold(
            extendBody: true,
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),

            // floatingActionButton:
            //
            //
            // FloatingActionButton.extended(
            //   elevation: 10,
            //   backgroundColor: Colors.green,
            //   foregroundColor: Colors.black,
            //   icon: Icon(Icons.camera),
            //   label: Text('SCAN BOARD'),
            //   tooltip: "SCAN BOARD",
            //   splashColor: ColorsFile.colorred,
            //   onPressed: () {
            //     print("___CENTER PRESSED ------");
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Scan()),
            //     );
            //   },
            //   //params
            // ),
            //
            //
            //
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: DotNavigationBar(
              enablePaddingAnimation: true,
              currentIndex: _selectedIndex,
              dotIndicatorColor: Colors.red,
              unselectedItemColor: Colors.black38,
              backgroundColor: Colors.white,
              onTap: _handleIndexChanged,
              items: [
                DotNavigationBarItem(
                  icon: Icon(Icons.home),
                  selectedColor: Colors.black,
                ),
                DotNavigationBarItem(
                  icon: Icon(Icons.translate),
                  selectedColor: Colors.black,
                ),
                DotNavigationBarItem(
                  icon: Icon(Icons.book),
                  selectedColor: Colors.black,
                ),
                DotNavigationBarItem(
                  icon: Icon(Icons.message),
                  selectedColor: Colors.black,
                ),
              ],
            ),

            // AnimatedBottomNavigationBar(
            //   icons: [
            //     Icons.home,
            //     Icons.translate,
            //     Icons.book,
            //     Icons.record_voice_over_rounded
            //   ],
            //   activeIndex: _selectedIndex,

            //   iconSize: 28,
            //   backgroundColor: Colors.blueAccent,
            //   gapLocation: GapLocation.center,
            //   notchSmoothness: NotchSmoothness.softEdge,
            //   onTap: _onItemTapped,
            //   activeColor: ColorsFile.colorred,
            //   splashColor: Colors.blue,
            //   leftCornerRadius: 20,
            //   rightCornerRadius: 20,
            //   elevation: 12,
            // ),
          ),
        ),
      ),
    );
  }
}

//EXIT POPUP
Future<bool> exit(BuildContext context) async {
  return await showDialog(
    builder: (context) => AlertDialog(
      title: Text("Exit !"),
      content: Text("Confirm, you want to quit PAR?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Yes")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("No")),
      ],
    ),
    context: context,
  );
}

// enum _SelectedTab { Home(), Trans, Learn, Extra }
