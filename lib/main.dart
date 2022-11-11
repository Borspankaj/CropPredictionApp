import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getSoilInfo() {
    print('Working') ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MaterialApp(
        color: Colors.white,

        home : Container (
          child : OutlinedButton(
                  onPressed: () { getSoilInfo() ;},
                  child: Text('Get soil Info' , textDirection: TextDirection.ltr,) ,

        ),

      ),

    ),
    );
  }
}

