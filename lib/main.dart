import 'package:flutter/material.dart';
import 'package:tictacgame/Screens/HomePage.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black12,
        splashColor: Colors.white24,
        shadowColor: Colors.black
      ),
      home: HomePage(),
    );
  }
}
