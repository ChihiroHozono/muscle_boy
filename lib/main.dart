import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger();
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUSCLE BOY',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Muscle(),
    );
  }
}

class Muscle extends StatefulWidget{
  const Muscle({Key? key}) : super(key: key);

  @override
  _MuscleState createState() => _MuscleState();
}


class _MuscleState extends State<Muscle> {
  bool isPlay = false;
  final player = AudioPlayer();
  double _currentSliderValue = 1.0;


  String imagePath = 'assets/images/muscle_boy1.png';

  void _setPlayStatus(){
    setState(() {
      isPlay = player.playing;
    });
  }

  void _ctrSound(){
    String soundNum = (Random().nextInt(2) + 2).toString();
    String soundPath = 'assets/sounds/power$soundNum.mp3';
    logger.info(soundPath);
    player.setAsset(soundPath, preload: false);
    player.load();

    if (isPlay){
      logger.info('pause sound');
      player.stop();
    }else{
      logger.info('play sound');
      player.play();
    }
    _setPlayStatus();
  }

  @override
  Widget build(BuildContext context){
    player.setSpeed(_currentSliderValue);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MUSCLE BOY'),
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: (){
                  logger.info('on taped');
                  _ctrSound();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(imagePath),
                )
              ),
              Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max:10.0,
                  divisions:10,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    }
                  );
                },
              ),
              IconButton(
                iconSize: 50,
                onPressed: _ctrSound,
                icon: Icon(isPlay ? Icons.pause : Icons.play_arrow),
              )
            ],
          )
      ),
    );
  }
}