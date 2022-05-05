import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  String path = 'assets/sounds/power3.mp3';


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
              print('start');
              player.setAsset(path);
              player.play();
              print('end');
            },
            child: Image.asset('assets/images/muscle_boy1.png'),
          )
        ),
      )
    );
  }
}