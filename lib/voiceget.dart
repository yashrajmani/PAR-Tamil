import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:par_tamil/voice.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'constants/colors.dart';

class VoiceCheck extends StatefulWidget {
  const VoiceCheck({Key? key}) : super(key: key);

  @override
  State<VoiceCheck> createState() => _VoiceCheck();
}

class _VoiceCheck extends State<VoiceCheck> {
  final Map<String, HighlightedWord> _highlights = {
    'hi': HighlightedWord(
      onTap: () => print('hi'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'come': HighlightedWord(
      onTap: () => print('come'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'go': HighlightedWord(
      onTap: () => print('go'),
      textStyle: const TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'thanks': HighlightedWord(
      onTap: () => print('thanks'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press to record...';
  double _confidence = 1.0;
  final String _selectedLocaleId = 'ta_IN';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
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
              'Voice Translator',
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 8,
            backgroundColor: Colors.black,
          ), //AppBar




          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(18),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  shape: const StadiumBorder(),
                  elevation: 5,
                  primary: _text.isNotEmpty ? ColorsFile.cc : Colors.grey,
                  shadowColor:ColorsFile.colorpurple ,

                ),

                onPressed: () {
                  setState(() {
                    this._text = _text;
                  });

                  if (_text.isNotEmpty) {
                    print("---TEXT PUSHING TO TRANSLATE ");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Voice(
                                  voicetext: _text,
                                )));
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
                      'TRANSLATE',
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

              ),
            ),
          ),



          // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          // floatingActionButton:
          //

          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [

                AvatarGlow(
                  animate: _isListening,
                  glowColor: ColorsFile.cc,
                  endRadius: 200,
                  duration: const Duration(milliseconds: 2000),
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  repeat: true,
                  child: FloatingActionButton.large(
                    foregroundColor: ColorsFile.cc,
                    onPressed: _listen,

                    child: Icon(_isListening ? Icons.mic : Icons.mic_none,
                      size: 80,),
                  ),
                ),



                Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 150.0),
                  child: TextHighlight(
                    text: _text,

                    words: _highlights,
                    textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
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

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          localeId: _selectedLocaleId,
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
