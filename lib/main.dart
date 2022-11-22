import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'hompage.dart';

void main() {
  runApp(const MyHome());
}
class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Center(
          child: Column( children : [ Image.asset('lib/icons/logo.png' , scale: 10,),
                const Text('KHETI') ]),
        ),
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.greenAccent,),
    );
  }
}


