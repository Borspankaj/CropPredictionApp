import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'suggestedfertilizer.dart';
class Fertilizer extends StatefulWidget {
  const Fertilizer({Key? key}) : super(key: key);

  @override
  State<Fertilizer> createState() => _FertilizerState();
}

class _FertilizerState extends State<Fertilizer> {
  var suggestion = " ";

  var decode ;
  var values = {"crop" : "" ,
    "nitrogen" : "" ,
  "phosphorus" : "" ,
  "potassium" : "" , };
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
              onChanged: (text) { values['crop'] = text ; } ,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Crop',
                hintText: 'Crop',
              ),
            ),
          ),
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
                      'http://10.0.2.2:5000//get-fertilizer?params=$params');
                  var data = await getfertilizer(url);
                  decode = jsonDecode(data);
                  suggestion = decode['fert'] ;
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
                        suggestedfertilizer(recordName : suggestion)),
                  );

                } ,



                child : const Text ('Get Suggestion'),
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
