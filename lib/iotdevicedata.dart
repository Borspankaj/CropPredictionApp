import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'package:cropyeild/predictedcrop.dart';
import 'dart:ui';

class Iotdevice extends StatefulWidget {
  const Iotdevice({Key? key}) : super(key: key);

  @override
  State<Iotdevice> createState() => _IotdeviceState();
}

class _IotdeviceState extends State<Iotdevice> {
  var _t = "";
  var _h = "" ;
  var _ph = "" ;
  var _n = "" ;
  var _p = "" ;
  var _k = "" ;
  var _rf = "" ;
  var prediction = " ";

  var decode ;
  var values = {"n" : "" ,
    "p" : "" ,
    "k" : "" ,
    "t" : "" ,
    "h" : "" ,
    "ph" : "" ,
    "rf" : ""};
  final database = FirebaseDatabase.instance.ref() ;

  @override
  void initState() {
    super.initState() ;
    _activateListeners();
  }

  void _activateListeners() {
    database.child('test/sagar/temperature').onValue.listen((event) {
      final String t = "${event.snapshot.value}";
      setState(() {
        values['t'] = t ;
        _t = t ;
      });
    });
    database.child('test/sagar/humidity').onValue.listen((event) {
      final String h = "${event.snapshot.value}";
      setState(() {
        values['h'] = h ;
        _h = h ;
      });
    });
    database.child('test/sagar/ph').onValue.listen((event) {
      final String ph = "${event.snapshot.value}";
      setState(() {
        values['ph'] = ph ;
        _ph = ph ;
      });
    });
    database.child('test/sagar/N').onValue.listen((event) {
      final String n = "${event.snapshot.value}";
      setState(() {
        values['n'] = n ;
        _n = n;
      });
    });
    database.child('test/sagar/P').onValue.listen((event) {
      final String p = "${event.snapshot.value}";
      setState(() {
        values['p'] = p ;
        _p = p ;
      });
    });
    database.child('test/sagar/K').onValue.listen((event) {
      final String k = "${event.snapshot.value}";
      setState(() {
        values['k'] = k ;
        _k = k ;
      });
    });
    database.child('test/sagar/rf').onValue.listen((event) {
      final String rf = "${event.snapshot.value}";
      setState(() {
        values['rf'] = rf ;
        _rf = rf ;
      });
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title : const Text("Soil Information" , style: TextStyle(
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
              fit: BoxFit.fill),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0 , sigmaY: 3.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.00),
                        color: Colors.green.shade200,
                      ),
                      height: 120,
                      width: 120,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Nitrogen' ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 15,

                              ),
                            ),
                            Text(_n ,textAlign: TextAlign.center,style: const TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 40,

                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.00),
                        color: Colors.green.shade200,
                      ),
                      height: 120,
                      width: 120,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Phosphorus' ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 15,

                              ),
                            ),
                            Text(_p ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.00),
                        color: Colors.green.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Potassium' ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 15,

                              ),
                            ),
                            Text(_k ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,

                              ),),
                          ],
                        ),
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.00),
                        color: Colors.green.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Rainfall' ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 15,

                              ),
                            ),
                            Text(_rf ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,

                              ),),
                          ],
                        ),
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.00),
                        color: Colors.green.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Temperature' ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 15,

                              ),
                            ),
                            Text(_t ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,

                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.00),
                        color: Colors.green.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Humidity' ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 15,

                              ),
                            ),
                            Text(_h ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,

                              ),),
                          ],
                        ),
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.00),
                        color: Colors.green.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('pH' ,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 15,

                              ),
                            ),
                            Text(_ph ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,

                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ) ,

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
                          'http://flask-env-1.eba-3wdrxkaf.us-east-1.elasticbeanstalk.com///get-prediction?params=$params');
                      var data = await getprediction(url);
                      decode = jsonDecode(data);
                      prediction = decode['prediction'] ;
                    } ,



                    child : const Text ('Get This data' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 15,

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



                    child : const Text ('Predict' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 15,

                    ),),
                  ),
                ),
              ),
            ],
            ),
          ),
        ),
      )


    ),
    );
  }
}
