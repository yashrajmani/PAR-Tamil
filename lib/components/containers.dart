
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:par_tamil/constants/colors.dart';



class ContainerB extends StatelessWidget {
  ContainerB({
    Key? key,
    required this.title,
    required this.imgno,
  });


  String title;
  String imgno;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsFile.cc,
      shadowColor: Colors.blueGrey,
      elevation: 20,
      borderOnForeground: true,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          color: Colors.transparent,

          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              child: Image(
                image: AssetImage("assets/images/$imgno.png"),
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}