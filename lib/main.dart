import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_music/screen/homepage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Land',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePage()),
    );
  }
}
