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
  double _t = 8.00;
  double _h = 14.00 ;
  double _ph = 0.00 ;
  double _n = 0.00 ;
  double _p = 0.00 ;
  double _k = 0.00 ;
  double _rf = 20.0 ;
  var prediction = " ";

  var decode ;
  var values = {
    "nitrogen" : "" ,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text ('Nitrogen' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 16,

                    ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 60,

                      child: Slider(
                        min: 0.0,
                        max: 255.0,
                        value: _n,
                        label: '$_n',
                        divisions: 255,
                        onChanged: (value) {
                          setState(() {
                            _n = value ;
                            values['nitrogen'] = '$value';
                          });
                        },
                      ),
                    ),
                  ]
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text ('Phosphorus' , style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 16,

                      ),
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,

                        child: Slider(
                          min: 0.0,
                          max: 150.0,
                          value: _p,
                          label: '$_p',
                          divisions: 150,
                          onChanged: (value) {
                            setState(() {
                              _p = value ;
                              values['phosphorus'] = '$value';
                            });
                          },
                        ),
                      ),
                    ]
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text ('Potassium' , style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 16,

                      ),
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,

                        child: Slider(
                          min: 0.0,
                          max: 210.0,
                          value: _k,
                          label: '$_k',
                          divisions: 210,
                          onChanged: (value) {
                            setState(() {
                              _k = value ;
                              values['potassium'] = '$value';
                            });
                          },
                        ),
                      ),
                    ]
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text ('Temperature' , style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 16,

                      ),
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,

                        child: Slider(
                          min: 8,
                          max: 45.0,
                          value: _t,
                          label: '$_t',
                          divisions: 225,
                          onChanged: (value) {
                            setState(() {
                              _t = value ;
                              values['temperature'] = '$value';
                            });
                          },
                        ),
                      ),
                    ]
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text ('Humidity' , style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 16,

                      ),
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,

                        child: Slider(
                          min: 14,
                          max: 100,
                          value: _h,
                          label: '$_h',
                          divisions: 430,
                          onChanged: (value) {
                            setState(() {
                              _h = value ;
                              values['humidity'] = '$value';
                            });
                          },
                        ),
                      ),
                    ]
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text ('pH' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 16,

                    ),
                    ),

                    SizedBox(
                      height : 60 ,
                      width: 300,
                      child: Slider(
                        min: 0.0,
                        max: 14.0,
                        value: _ph,
                        label: '$_ph',
                        divisions: 28,
                        onChanged: (value) {
                          setState(() {
                            _ph = value ;
                            values['ph'] = "$value";
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text ('Rainfall' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 16,

                    ),
                    ),

                    SizedBox(
                      height : 60 ,
                      width: 300,
                      child: Slider(
                        min: 20.0,
                        max: 300.0,
                        value: _rf,
                        label: '$_rf',
                        divisions: 280,
                        onChanged: (value) {
                          setState(() {
                            _rf = value ;
                            values['rainfall'] = "$value";
                          });
                        },
                      ),
                    ),
                  ],
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
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                PredictedCrop(recordName: prediction)),
                          );
                          } ,



                      child : const Text ('Submit' , style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 16,

                      ),
                      ),
                  ),
                ),
              ),
    //             Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: SizedBox(
    //                 width: 200,
    //                 height: 50,
    //                 child: ElevatedButton(
    //                   style : ButtonStyle(
    //                       backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF50C878)),
    //                       foregroundColor: MaterialStateProperty.all<Color>(Colors.white) ,
    //                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                           const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.00)))),
    //                       shadowColor: MaterialStateProperty.all<Color>(Colors.white)
    //                   ),
    //                 onPressed: ()
    // {
    //                   Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) =>
    //                   PredictedCrop(recordName: prediction)),
    //                   );
    //
    //                 } ,
    //
    //
    //
    //                 child : const Text ('Predict' ,style: TextStyle(
    //                   fontFamily: 'BebasNeue',
    //                   fontSize: 16,
    //
    //                 ), ),
    //             ),
    //             ),
    //             ),



            ]
            ),
          ),
        ),
      ),

    ),
    );
  }



}

