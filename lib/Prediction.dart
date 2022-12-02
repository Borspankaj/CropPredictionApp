import 'package:cropyeild/predictedcrop.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'dart:ui';

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
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(
      appBar: AppBar(
        title : const Text("KHETI" , style: TextStyle(
          fontFamily: 'BebasNeue' ,
          color: Colors.black ,
        )),
        centerTitle : true ,
        backgroundColor : const Color(0xFF50C878),
        // actions : <Widget> [ IconButton(onPressed: () {}, icon: const Icon(Icons.add_card_outlined))] ,
      ),

      body : Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(

              image: AssetImage("assets/predic.jpg"),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0 , sigmaY: 3.0),
          child: SingleChildScrollView(
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
                    style : ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF50C878)),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white) ,
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.00)))),
                        shadowColor: MaterialStateProperty.all<Color>(Colors.white)
                    ),
                    onPressed: ()
                        async {
                          var params = "";
                          for (var k in values.keys) {
                          params += "${values[k]} ";
                          }
                          var url = Uri.parse(
                          'http://flask-env-1.eba-3wdrxkaf.us-east-1.elasticbeanstalk.com//get-prediction?params=$params');
                          var data = await getprediction(url);
                          decode = jsonDecode(data);
                          prediction = decode['prediction'] ;
                          } ,



                      child : const Text ('Submit' , style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 16,

                      ),),
                  ),
                ),
              ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style : ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF50C878)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white) ,
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.00)))),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.white)
                      ),
                    onPressed: ()
    {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      PredictedCrop(recordName: prediction)),
                      );

                    } ,



                    child : const Text ('Predict' ,style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 16,

                    ), ),
                ),
                ),
                ),



            ]
            ),
          ),
        ),
      ),

    ),
    );
  }



}

