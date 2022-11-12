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
    print('Working');
  }

  @override
  Widget build(BuildContext context) {
    return Material(

      color: Colors.white,
      child: Center(
        child: Text(
          'Hello',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
