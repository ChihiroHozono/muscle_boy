import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  String sound_path = 'assets/sounds/power3.mp3';
  String image_path = 'assets/images/muscle_boy1.png';

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return MaterialApp(
      title: 'MUSCLE BOY',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('MUSCLE BOY'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: (){
              logger.info('on taped');
              player.setAsset(sound_path);
              player.play();
            },
            child: Image.asset(image_path),
          )
        ),
      )
    );
  }
}