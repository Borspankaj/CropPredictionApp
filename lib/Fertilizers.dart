import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'suggestedfertilizer.dart';
import 'dart:ui';
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
    return MaterialApp( debugShowCheckedModeBanner: false,home: Scaffold(
      appBar: AppBar(
        title : const Text("Fertilizers" , style: TextStyle(
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
                          'http://flask-env-1.eba-3wdrxkaf.us-east-1.elasticbeanstalk.com//get-fertilizer?params=$params');
                      var data = await getfertilizer(url);
                      decode = jsonDecode(data);
                      suggestion = decode['fert'] ;
                    } ,



                    child : const Text ('Submit' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 16,

                    ),
                    ),
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
                            suggestedfertilizer(recordName : suggestion)),
                      );

                    } ,



                    child : const Text ('Get Suggestion' ,
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 16,

                      ),),
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
