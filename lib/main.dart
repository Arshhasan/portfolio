import 'package:flutter/material.dart';
import 'package:portfolio/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'that flutter guy',
      theme: ThemeData(

        fontFamily: 'EduVICWANTHand',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: Homepage()
    );
  }
}
