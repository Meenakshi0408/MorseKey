import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);

    // Load the audio file (asset) on initialization
    playmorc("0");
  }

  void playAudio() async {
    await player.resume();
  }

  void pauseAudio() async {
    await player.pause();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Audio Player Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: playAudio,
                child: Text('Play Audio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Future<void> playmorc(String s) async{

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource('$s.wav'));
      // Uncomment the line below if you want to pause immediately after loading
       await player.pause();
    });
  }
}