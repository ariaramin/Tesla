import 'package:flutter/material.dart';
import 'package:tesla/screens/HomeScreen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Gotham"),
      home: HomeScreen(),
    );
  }
}
