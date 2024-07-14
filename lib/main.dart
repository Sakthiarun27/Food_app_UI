import 'package:flutter/material.dart';
// import 'package:foodapp/home_screen.dart';
import 'login_screen.dart';
import 'home_screen.dart';
// import 'home_screen.dart';

void main() {
  runApp(const Initialscreen());
}

class Initialscreen extends StatelessWidget {
  const Initialscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: 'foodie',

    );
  }
}
