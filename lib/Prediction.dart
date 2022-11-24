import 'package:cropyeild/predictedcrop.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';


class Home extends StatefulWidget {
  const Home({Key? key} ) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var prediction = " ";

  var decode ;
  var values = {"nitrogen" : "" ,
    "phosphorus" : "" ,
    "potassium" : "" ,
    "temperature" : "" ,
    "humidity" : "" ,
    "ph" : "" ,
    "rainfall" : ""};
  @override
  Widget build(BuildContext context) {
    return MaterialApp( home: Scaffold(
      appBar: AppBar(
        title : const Text("KHETI"),
        centerTitle : true ,
        backgroundColor : Colors.lightGreen,
        // actions : <Widget> [ IconButton(onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.add_card_outlined))] ,
      ),

      body : SingleChildScrollView(
        child: Column( children :[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) { values['nitrogen'] = text ; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nitrogen',
                hintText: 'Nitrogen',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) { values['phosphorus'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'phosphorus',
                hintText: 'phosphorus',
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) { values['potassium'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'potassium',
                hintText: 'potassium',
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) { values['temperature'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'temperature',
                hintText: 'temperature',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) { values['humidity'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'humidity',
                hintText: 'humidity',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) { values['ph'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ph',
                hintText: 'Ph',
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text) { values['rainfall'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'rainfall',
                hintText: 'rainfall',
              ),
            ),
          ),


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
                onPressed: ()
                    async {
                      var params = "";
                      for (var k in values.keys) {
                      params += "${values[k]} ";
                      }
                      var url = Uri.parse(
                      'http://10.0.2.2:5000//get-prediction?params=$params');
                      var data = await getprediction(url);
                      decode = jsonDecode(data);
                      prediction = decode['prediction'] ;
                      } ,



                  child : const Text ('Submit'),
              ),
            ),
          ),
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
                onPressed: ()
    {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                  PredictedCrop(recordName: prediction)),
                  );

                } ,



                child : const Text ('Predict'),
            ),
            ),
            ),



        ]
        ),
      ),

    ),
    );
  }



}

