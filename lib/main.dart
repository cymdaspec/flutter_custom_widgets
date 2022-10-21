import 'package:flutter/material.dart';
import 'package:flutter_custom_widgets/widgets/music_player/music_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Custom Widgets testing page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: Player(audio: 'https://www.naijafinix.com.ng/wp-content/uploads/2022/02/Yung-Lean-%E2%80%93-Ginseng-Strip-2002-via-Naijafinix.com_.mp3?_=1'),
        )
      )
    );
  }
}
