import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hack/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class jomon extends StatefulWidget {
  const jomon({super.key});

  @override
  State<jomon> createState() => _jomonState();
}

class _jomonState extends State<jomon> {
  int _b = 0;
  increment() {
    _b >= 2 ? _b = 0 : _b++;
  }

  late FlutterTts flutterTts;
  bool isInitialized = false;
  void initState() {
    super.initState();
    initTts();
  }

  Future<void> initTts() async {
    flutterTts = FlutterTts();
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.35);
    setState(() {
      isInitialized = true;
    });
    await speak(
        "Choose your Category  Now selected Blind Double Tap for Confirmation swipe for change");
  }

  Future<void> speak(String text) async {
    if (isInitialized) {
      await flutterTts.speak(text);
    }
  }

  // Method to save selected button value
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails end) {
            increment();
            print(_b);
            if (_b == 0)
              speak(
                  "Now selected Blind Double tap for cofirmation swipe for change option");
            else if (_b == 1)
              speak(
                  "Now selected Deaf Double tap for confirmation swipe for change option");
            else
              speak(
                  "Now Selected Normalperson tap for confirmation swipe for change option");
          },
          onDoubleTap: () {
            int c = 0;
            _b==0?c=1:c=2;
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Home(a: c);
            }));
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 180, left: 50, right: 50),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 192, 127, 127),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: TextButton(
                    onPressed: () async {},
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image(
                            image: AssetImage('assets/images/pngegg.png'),
                            width: 84,
                            height: 84,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            'Blind',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 192, 127, 127),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: TextButton(
                    onPressed: () async {},
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image(
                            image: AssetImage('assets/images/file.png'),
                            width: 84,
                            height: 84,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            'Deaf',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 192, 127, 127),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: TextButton(
                    onPressed: () async {},
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image(
                            image: AssetImage('assets/images/normal.png'),
                            width: 84,
                            height: 84,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: Text(
                            'Normal',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
