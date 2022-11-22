import 'package:flutter/material.dart';
import 'Prediction.dart';
import 'predictedcrop.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var details = {'crop' : 'jute '} ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp( home: Scaffold(
        appBar: AppBar(
          title : const Text("KHETI"),
          centerTitle : true ,
          backgroundColor : Colors.lightGreen,
          // actions : <Widget> [ IconButton(onPressed: () {}, icon: const Icon(Icons.add_card_outlined))] ,
    ),

        body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style : ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen ,
                  foregroundColor: Colors.white ,
          ),
                  onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (details) => const Home()),
                );} ,
                    child: const Text('Do you have soil info ?')),
              ),
            ) ,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style : ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen ,
                        foregroundColor: Colors.white ,
                      ),
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (details) => const PredictedCrop(recordName: "recordName")),
                      );}, child: const Text('Get Prediction from device'))),
            )

    ],
          ),
        ),
    ) ,
    );
  }
}
