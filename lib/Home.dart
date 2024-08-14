// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hack/list.dart';

class Home extends StatefulWidget {
   Home({super.key,required this.a});
  final int a;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FlutterTts flutterTts;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  Future<void> initTts() async {
    flutterTts = FlutterTts();
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.25);
    setState(() {
      isInitialized = true;
    });
    await speak("Double tap for Tutorial   Swipe left for Practise");
  }

  Future<void> speak(String text) async {
    if (isInitialized) {
      await flutterTts.speak(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: widget.a==1?Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 450,
                  width: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onDoubleTap: () async {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Homescreen(a:widget.a);
                          }));
                          String textToRead = index == 0
                              ? "Enjoy Learning Morse code"
                              : "Start your practise session";
                          await speak(textToRead);
                        },
                        onTap: () async {
                          String textToRead = index == 0
                              ? "Double tap for Tutorial   Swipe left for Practise A selected"
                              : "Double tap for Practice    Swipe right for Tutorial";
                          await speak(textToRead);
                        },
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Card(
                              color: Color.fromARGB(255, 192, 127, 127),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(80),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.asset(
                                          "assets/morse.png",
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      index == 0 ? "Tutorial" : "Practice",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      index == 0
                                          ? "Learn Morse code"
                                          : "Test your level",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ):
        Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 450,
                  width: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Homescreen(a:widget.a);
                          }));
                          String textToRead = index == 0
                              ? "Enjoy Learning Morse code"
                              : "Start your practise session";
                          await speak(textToRead);
                        },
                        
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Card(
                              color: Color.fromARGB(255, 192, 127, 127),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  topLeft: Radius.circular(80),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: Image.asset(
                                          "assets/morse.png",
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      index == 0 ? "Tutorial" : "Practice",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      index == 0
                                          ? "Learn Morse code"
                                          : "Test your level",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
