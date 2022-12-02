import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Location Page")),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('LAT: '),
                const Text('LNG: '),
                const Text('ADDRESS: '),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get Current Location"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
