import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:par_tamil/routes/results.dart';
import 'package:translator/translator.dart';

import '../constants/colors.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _Scan();
}

class _Scan extends State<Scan> {
  File? imgFile;
  //String imgurl = '';
  //bool urlload = false;
  bool oktrans = false;

  //OUTPUT
  String res = "";
  String singleline = "";
  String eng = "";
  String hin = "";
  String lines = "";

  //IMAGE SELECT==================================
  Future getImg(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 75);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        imgFile = img;
        // Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      imgFile = null;
      Navigator.of(context).pop();
      print("####### ERROR IAMGE #####");
    }
  }

  //-----------------CROP SELECTED IMAGE ------------------------------
  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  //---------------------------------------------------------
  //==============================================================

  //URL FROM FIREBASE STORAGE ---------------------------------
  // uploadPic(File image) async {
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   String url = '';
  //   Reference ref = storage.ref().child("image" + DateTime.now().toString());
  //   UploadTask uploadTask = ref.putFile(image);
  //   uploadTask.whenComplete(() async {
  //     url = await ref.getDownloadURL();
  //     print(url);
  //
  //     setState(() {
  //       imgurl = url;
  //       urlload = true;
  //       Future.delayed(const Duration(seconds: 4));
  //       answer();
  //     });
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  //   print("-------------IMAGE UPLOADED--------------");
  //   print(imgurl);
  //   print(urlload);
  // }
  //-----------------------------------------------------------

  //TAMIL OCR API-----------------------------------------------
  getres(File img, String lang, String ocr) async {
    print("____ GET TAMIL RESULT CALLED ---------");

    var headers = {'apikey': 'K83739749788957'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api.ocr.space/parse/image'));
    request.fields
        .addAll({'language': lang, 'OCREngine': ocr, 'filetype': 'jpg'});

    //SENDING IMAGE FILE DIRECTLY TO API
    request.files.add(
      http.MultipartFile(
        'file',
        imgFile!.readAsBytes().asStream(),
        imgFile!.lengthSync(),
        filename: 'img',
      ),
    );

    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      print("Result: ${response.statusCode}");
      final data = jsonDecode(response.body);
      print(data);
      print("------- DATA PRINTING------------------------------");
      print(data['ParsedResults'][0]['ParsedText']);

      res = (data['ParsedResults'][0]['ParsedText']).toString();
      lines = (data['ParsedResults'][0]['TextOverlay']['Message']).toString();
      setState(() {
        this.res = res;
        this.lines = lines;
      });
      EasyLoading.showSuccess('Text Recognised!');
      EasyLoading.dismiss();
      print("------ TRANSLATE NOW-----------------------------");
      transt(res);
    } else {
      print("---_ERROR OCR API-----");
      EasyLoading.showError('Failed to Load, Try Again');
      EasyLoading.dismiss();
      throw Exception('Failed to get result');
    }
  }
//------------------------------------------------------------------------------

  GoogleTranslator translator = GoogleTranslator();
  //==================== TRANSALTE ======================
  void transt(String res) {
    singleline = res.replaceAll("\r\n", " ");
    if (res != '') {
      print("0k RESULTS ,Now translate $singleline");

      translator.translate(singleline, to: 'en').then((output) {
        setState(() {
          eng = output
              .toString(); //placing the translated text to the String to be used
        });
        print(eng);
      });

      translator.translate(singleline, to: 'hi').then((output) {
        setState(() {
          hin = output
              .toString(); //placing the translated text to the String to be used
        });
        print(hin);
      });

      setState(() {
        this.singleline = singleline;
        this.eng = eng;
        this.hin = hin;
        oktrans = true;
      });
    } else {
      EasyLoading.showError('Failed to Load, Try Again');
      EasyLoading.dismiss();
    }
  }

  //void answer() {
  //  if (imgurl != '' && urlload == true) {
  // print("0k img url $imgurl");
  // getres(imgFile!, 'tam', '3');
  // }
  // if (urlload == false) {
  // EasyLoading.showError('TRY AGAIN!');
  // EasyLoading.dismiss();
  //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   content: Text("Unable to Upload Image,Check Internet !"),
  //  ));
  // //}
  //
  // if (res != '') {
  //   EasyLoading.showSuccess('Done!');
  //   EasyLoading.dismiss();
  //   print("0k RESULTS $res");
  //   setState(() {
  //
  //   });
  // }
  //NEXT PAGE
  // }

  //-------------------------------------------
  @override
  void initState() {
    GoogleTranslator translator = GoogleTranslator();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    EasyLoading.dismiss();
    super.dispose();
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

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  if (oktrans == true) {
                    print("-----VIEW RESULTS------------");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Results(
                                res: res,
                                singleline: singleline,
                                hin: hin,
                                eng: eng,
                                lines: lines,
                              )),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Unable to Translate ! Try Again"),
                    ));
                    EasyLoading.showError('Failed to Load, Try Again');
                    EasyLoading.dismiss();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'VIEW RESULTS',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 5,
                  primary: oktrans ? Colors.deepPurple.shade300 : Colors.grey,
                  shadowColor: ColorsFile.colorpurple,
                ),
              ),
            ),
          ),
          body: Center(
              child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),

                  imgFile != null
                      ? Image.file(
                          imgFile!,
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(20), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.asset('assets/images/use/upload.png',
                                  fit: BoxFit.cover),
                            ),
                          )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple.shade300,
                          onPrimary: Colors.grey,
                          shadowColor: Colors.grey[400],
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () {
                          getImg(ImageSource.gallery);
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 40,
                                  color: ColorsFile.colorwhite,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  "Use Gallery",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                      Container(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple.shade300,
                          onPrimary: Colors.grey,
                          shadowColor: Colors.grey[400],
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () {
                          getImg(ImageSource.camera);
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: ColorsFile.colorwhite,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  "Use Camera",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ],
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorsFile.cc,
                          onPrimary: Colors.grey,
                          shadowColor: Colors.grey[400],
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () {
                          print("------ RECOGNIZE TEXT CALLED ----------");

                          if (imgFile != null) {
                            EasyLoading.show(status: 'Recognising Text...');
                            getres(imgFile!, 'tam', '3');
                            //uploadPic(imgFile!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please Select an Image!"),
                            ));
                            EasyLoading.showError('Failed to Load, Try Again');
                            EasyLoading.dismiss();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Recognise Text",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              Icon(
                                Icons.image_search,
                                size: 25,
                                color: ColorsFile.colorwhite,
                              ),
                            ],
                          ),
                        ),
                      )),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  //S1-------------Upload image---------

                  // // Text(imgurl),
                  // Divider(
                  //   thickness: 4,
                  //   color: ColorsFile.colorpurple,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(6.0),
                  //   child: Text(
                  //     res,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.bold
                  //     ),
                  //   ),
                  // ),
                  // Divider(
                  //   thickness: 4,
                  //   color:  ColorsFile.colorpurple,
                  // ),

                  //
                  // Text("COUNT OF WORDS: $lines"),
                  // Divider(
                  //   thickness: 4,
                  // ),
                  // Text(singleline),
                  // Divider(
                  //   thickness: 4,
                  // ),
                  // Text(eng),
                  // Divider(
                  //   thickness: 4,
                  // ),
                  // Text(hin),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
