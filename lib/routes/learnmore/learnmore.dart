import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../constants/colors.dart';

class LearnMore extends StatelessWidget {
  LearnMore({
    Key? key,
    required this.titletext,
    required this.learnimg,
    required this.imgno,
  });
  String titletext;
  String imgno;
  String learnimg;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/use/bgimg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  print("--close pressed---");

                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CLOSE',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Icon(
                      Icons.close,
                      size: 25,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 5,
                  primary: ColorsFile.colorred,
                  shadowColor: ColorsFile.timecolor,
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0) //
                            ),
                        border: Border.all(color: Colors.blueAccent)),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.26,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0) //
                          ),
                      child: Image(
                        image: AssetImage("assets/images/$imgno.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  this.titletext,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                Divider(
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                  color: ColorsFile.colorwhite,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InteractiveViewer(
                    panEnabled: false, // Set it to false
                    boundaryMargin: EdgeInsets.all(100),
                    minScale: 0.5,
                    maxScale: 2,
                    child: Image.asset(
                      'assets/images/learning/$learnimg.png',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Divider(
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                  color: ColorsFile.colorwhite,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
