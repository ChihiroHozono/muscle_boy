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
  String sound_path = 'assets/sounds/power2.mp3';
  String image_path = 'assets/images/muscle_boy1.png';

  void _setPlayStatus(){
    setState(() {
      isPlay = player.playing;
    });
  }

  @override
  Widget build(BuildContext context){
    player.setAsset(sound_path,preload: true);
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
                  _setPlayStatus();
                  if (isPlay){
                    logger.info('pause sound');
                    player.pause();
                  }else{
                    logger.info('play sound');
                    player.play();
                  }

                },
                child: Image.asset(image_path),
              ),
              Icon(isPlay ? Icons.play_arrow : Icons.pause),
            ],
          )
      ),
    );
  }
}