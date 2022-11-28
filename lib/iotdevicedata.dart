import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'package:cropyeild/predictedcrop.dart';


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
        _n = n ;
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
          title : const Text("KHETI"),
          centerTitle : true ,
          backgroundColor : Colors.lightGreen,
    // actions : <Widget> [ IconButton(onPressed: () {}, icon: const Icon(Icons.add_card_outlined))] ,
    ),

      body : ListView(children: [
        Text(_n) ,
        Text(_p) ,
        Text(_k) ,
        Text(_rf) ,
        Text(_t) ,
        Text(_h) ,
        Text(_ph) ,

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



              child : const Text ('Get This data'),
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
      ],
      )


    ),
    );
  }
}
