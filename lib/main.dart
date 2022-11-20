import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var prediction = " ";
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
            backgroundColor : Colors.amberAccent.shade700,
            actions : <Widget> [ IconButton(onPressed: () {}, icon: const Icon(Icons.add_card_outlined))] ,
        ),

      body : SingleChildScrollView(
        child: Column( children :[
            TextField(
                onChanged: (text) { values['nitrogen'] = text ; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nitrogen',
                hintText: 'Nitrogen',
              ),
            ),

          TextField(
              onChanged: (text) { values['phosphorus'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'phosphorus',
                hintText: 'phosphorus',
              ),
            ),


           TextField(
              onChanged: (text) { values['potassium'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'potassium',
                hintText: 'potassium',
              ),
            ),


           TextField(
              onChanged: (text) { values['temperature'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'temperature',
                hintText: 'temperature',
              ),
            ),

            TextField(
              onChanged: (text) { values['humidity'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'humidity',
                hintText: 'humidity',
              ),
            ),

          TextField(
              onChanged: (text) { values['ph'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ph',
                hintText: 'Ph',
              ),
            ),


          TextField(
              onChanged: (text) { values['rainfall'] = text; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'rainfall',
                hintText: 'rainfall',
              ),
            ),


          IconButton(onPressed: () async {
            var params = "" ;
            for (var k in values.keys) {
              params += "${values[k]} ";
            }
          var url = Uri.parse('http://10.0.2.2:5000//api?params=$params');
          var data  = await Getprediction (url);
          var decode = jsonDecode(data) ;
          setState( () {
            prediction = decode['prediction'] ;}
          );
        },
            icon: const Icon(Icons.abc_rounded)
            ),
            const Center( child : Text("THE MOST SUITABLE CROP FOR YOUR FARM" ,style: TextStyle(
              color : Colors.blue ,
              fontSize: 30.0 ,),),),
            Center( child : Text(prediction ,style: const TextStyle(
              color : Colors.blue ,
            fontSize: 30.0 ,
            ),) ,), ]
        ),
      ),

    ),
    );



  }
}
