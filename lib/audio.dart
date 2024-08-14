import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hack/list.dart';
import 'package:hack/morse.dart';
import 'package:hack/practice.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Aud extends StatefulWidget {
  Aud({super.key, required this.j, required this.y,required this.a});
  final String j;
  final int a;
  final String y;

  @override
  State<Aud> createState() => _AudState();
}

class _AudState extends State<Aud> {
  late AudioPlayer player;
  int _b = 0;
  increment() {
    _b >= 2 ? _b = 0 : _b++;
  }

  void initState() {
    super.initState();
    initTts();
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);

    // Load the audio file (asset) on initialization
  }

  void dispose() async {
    await player.dispose();
    super.dispose();
  }

  late FlutterTts flutterTts;
  bool isInitialized = false;
  Future<void> initTts() async {
    flutterTts = FlutterTts();
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.35);
    setState(() {
      isInitialized = true;
    });
    //await speak("Double tap for Repeat Letter        swipe for next option");
  }

  Future<void> speak(String text) async {
    if (isInitialized) {
      await flutterTts.speak(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: widget.a==1?GestureDetector(
          onHorizontalDragStart: (DragStartDetails g) {
            increment();
            print(_b);
            if (_b == 0)
              speak("Double tap for Repeat Letter swipe for nextoption");
            else if (_b == 1)
              speak("Double tap for training letter swipe for nextoption");
            else
              speak("Double tap to change character swipe for next option");
          },
          onDoubleTap: () async {
            if (_b == 0) {
              await playmorc(widget.y);
              print("olak");
              await player.dispose();
            } else if (_b == 1) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Kanaran(h: widget.j,a:widget.a);
              }));
            } else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Homescreen(a:widget.a);
              }));
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 192, 127, 127),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Text(
                      widget.j,
                      style: const TextStyle(fontSize: 200),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 192, 127, 127),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Repeat',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 192, 127, 127),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Practice',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 192, 127, 127),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Change character',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ):
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 192, 127, 127),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Text(
                      widget.j,
                      style: const TextStyle(fontSize: 200),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 192, 127, 127),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                          onPressed: () async {
                            await playmorc(widget.y);
                 print("olak");
                  await player.dispose();
                          },
                          child: const Text(
                            'Repeat',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 192, 127, 127),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Kanaran(h: widget.j,a:widget.a);
              }));
                          },
                          child: const Text(
                            'Practice',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 192, 127, 127),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                          onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Homescreen(a:widget.a);
              }));
                          },
                          child: const Text(
                            'Change character',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  
  }

  Future<void> playmorc(String s) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      player = AudioPlayer();
      player.setReleaseMode(ReleaseMode.stop);
      await player.setSource(AssetSource('$s.wav'));
      // Uncomment the line below if you want to pause immediately after loading
      await player.pause();
      await player.resume();
    });
  }
}
