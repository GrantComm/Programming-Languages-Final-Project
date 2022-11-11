import 'package:flutter/material.dart';
import 'startScreen.dart';

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
      title: 'Twenty One',
      theme: ThemeData(
        primarySwatch: Colors.green,
        secondaryHeaderColor: Colors.green,
      ),
      home: StartScreen(),
    );
  }
}
