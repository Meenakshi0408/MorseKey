import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hack/audio.dart';
import 'package:audioplayers/audioplayers.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.a});
  final int a;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late FlutterTts flutterTts;
  bool isInitialized = false;
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    initTts();
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);

    // Load the audio file (asset) on initialization
  }

  void playAudio() async {
    await player.resume();
  }

  @override
  void dispose() async {
    await player.dispose();
    super.dispose();
  }

  Future<void> initTts() async {
    flutterTts = FlutterTts();
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.35);
    setState(() {
      isInitialized = true;
    });
    await speak("Letter A selected");
  }

  Future<void> speak(String text) async {
    if (isInitialized) {
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.speak(text);
    }
  }

  int _b = 0;
  increment() {
    _b >= 25 ? _b = 0 : _b++;
  }

  List<String> alpha = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.a == 1
            ? GestureDetector(
                onDoubleTap: () async {
                  print(alpha[_b] + "manu");
                  playmorc(_b.toString());
                  await player.dispose();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Aud(j: alpha[_b], y: _b.toString(),a:widget.a);
                  }));
                },
                onHorizontalDragEnd: (DragEndDetails details) async {
                  increment();
                  speak("Letter" + alpha[_b].toString() + "Selected");

                  print(alpha[_b]);
                },
                child: Stack(children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Container(
                          height: 90,
                          width: 200,
                          child: Center(
                              child: Text(alpha[index],
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 192, 127, 127),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      );
                    },
                    itemCount: alpha.length,
                  ),
                  //kanaran(),
                ]),
              )
            :ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              onTap:(){
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Aud(j: alpha[index], y: _b.toString(),a:widget.a);
                  }));
              },
              title: Container(
                height: 90,
                width: 200,
                child: Center(
                    child: Text(alpha[index],
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 192, 127, 127),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            );
          },
          itemCount: alpha.length,
        ), );
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
