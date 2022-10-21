import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Player extends StatefulWidget {
  const Player({
    Key? key,
    this.width,
    this.height,
    required this.audio,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String audio;

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final player = AudioPlayer();
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  bool isPlaying = false;

  int iconColor = 0xFFD9DCDE;

  bool _buttonOnPressed = false;

  void _handleTap() {
    setState(() {
      _buttonOnPressed = !_buttonOnPressed;
    });
    /*
    if (isPlaying == false) //убрать комменты чтобы воспроизведение было по нажатию кнопки
      {
        player.play(AssetSource(fileName));
        isPlaying = true;
      }
     */
    if (isPlaying == true) {
      player.pause();
      isPlaying = false;
    }
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
        print(position);
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: _handleTap, //изменение состояния плеера
              child: Text(
                'Listen audio',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF4472B),
                    decoration: TextDecoration.underline),
                textAlign: TextAlign.left,
              ),
            ),
            AnimatedOpacity(
              opacity: _buttonOnPressed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 24,
                    splashRadius: 15,
                    icon: Icon(CupertinoIcons.gobackward_10),
                    color: Color(iconColor),
                    onPressed: () {
                      position = position - Duration(seconds: 10);
                      if (position < Duration.zero) {
                        position = Duration.zero;
                      }
                      player.seek(position);
                      print(position);
                    },
                  ),
                  IconButton(
                    iconSize: 24,
                    splashRadius: 15,
                    icon: Icon(CupertinoIcons.stop),
                    color: Color(iconColor),
                    onPressed: () {
                      player.pause();
                      isPlaying = false;
                    },
                  ),
                  IconButton(
                    iconSize: 24,
                    splashRadius: 15,
                    icon: Icon(CupertinoIcons.play_arrow),
                    color: Color(iconColor),
                    onPressed: () {
                      if (isPlaying == false) {
                        player.play(AssetSource(widget.audio));
                      }
                      isPlaying = true;
                    },
                  ),
                  IconButton(
                    iconSize: 24,
                    splashRadius: 15,
                    icon: Icon(CupertinoIcons.goforward_10),
                    color: Color(iconColor),
                    onPressed: () {
                      position = position + Duration(seconds: 10);
                      player.seek(position);
                      print(position);
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}