import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'package:cropyeild/predictedcrop.dart';
import 'dart:ui';
import 'suggestedfertilizer.dart';
const List<String> list = <String>['rice', 'maize', 'chickpea', 'kidneybeans', 'pigeonpeas',
  'mothbeans', 'mungbean', 'blackgram', 'lentil', 'pomegranate',
  'banana', 'mango', 'grapes', 'watermelon', 'muskmelon', 'apple',
  'orange', 'papaya', 'coconut', 'cotton', 'jute', 'coffee'];
class Iotdevice extends StatefulWidget {
  const Iotdevice({Key? key}) : super(key: key);

  @override
  State<Iotdevice> createState() => _IotdeviceState();
}

class _IotdeviceState extends State<Iotdevice> {
  var _t = "0";
  var _h = "0" ;
  var _ph = "0.00" ;
  var _n = "0.00" ;
  var _p = "0.00" ;
  var _k = "0.00" ;
  var _rf = "0" ;
  var prediction = " ";
  String _crop = list.first ;
  var decode ;
  var suggestion = "";
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
                        color: Color(0xFF009970),
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
                                color: Colors.white ,

                              ),
                            ),
                            Text(_n ,textAlign: TextAlign.center,style: const TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 40,
                              color: Colors.white ,

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
                        color: Color(0xFF009970),
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
                                color: Colors.white ,

                              ),
                            ),
                            Text(_p ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,
                                color: Colors.white ,

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
                        color: Color(0xFF009970),
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
                                color: Colors.white ,

                              ),
                            ),
                            Text(_k ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,
                                color: Colors.white ,

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
                        color: Color(0xFF009970),
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
                                color: Colors.white ,

                              ),
                            ),
                            Text(_rf ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,
                                color: Colors.white ,

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
                        color: Color(0xFF009970),
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
                                color: Colors.white ,

                              ),
                            ),
                            Text(_t ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,
                                color: Colors.white ,

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
                        color: Color(0xFF009970),
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
                                color: Colors.white ,

                              ),
                            ),
                            Text(_h ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,
                                color: Colors.white ,

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
                        color: Color(0xFF009970),
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
                                color: Colors.white ,

                              ),
                            ),
                            Text(_ph ,
                                textAlign: TextAlign.center ,
                              style: const TextStyle(
                                fontFamily: 'BebasNeue',
                                fontSize: 40,
                                color: Colors.white ,

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
                      final navigator = Navigator.of(context);
                      var params = "";
                      for (var k in values.keys) {
                        params += "${values[k]} ";
                      }
                      var url = Uri.parse(
                          'http://flask-env-1.eba-3wdrxkaf.us-east-1.elasticbeanstalk.com///get-prediction?params=$params');
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



                    child : const Text ('Predict Crop' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 15,

                    ),),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text ('Crop you want to grow !' , style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 40,

                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text ('Select Crop : -' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 25,


                    ),
                    ),


                    DropdownButton<String>(
                      value: _crop,

                      icon: const Icon(Icons.arrow_downward),


                      dropdownColor: const Color(0xFF6092E851),
                      menuMaxHeight: 400,
                      alignment: Alignment.center,
                      borderRadius: BorderRadius.circular(15.00),
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,

                        color: Colors.deepPurpleAccent,
                      ),

                      onChanged: (String? value) {

                        setState(() {
                          _crop = value!;
                          // values['crop'] = _crop;
                        });
                      },

                      items: list.map<DropdownMenuItem<String>>((String value) {

                        return DropdownMenuItem<String>(

                          value: value,
                          child: Text(value , style: const TextStyle(
                            shadows: <Shadow>[Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 5,

                              color: Color(0xff646464),
                            )],
                            fontFamily: 'BebasNeue',
                            fontSize: 22,
                            color: Color(0xFFFFFFFF),
                            decorationStyle: TextDecorationStyle.wavy


                          ),

                          ),
                        );
                      }).toList(),
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
                      var params = '$_crop ${_n} ${_p} ${_k}' ;
                      var url = Uri.parse(
                          'http://flask-env-1.eba-3wdrxkaf.us-east-1.elasticbeanstalk.com/get-fertilizer?params=$params');
                      var data = await getfertilizer(url);

                      decode = jsonDecode(data);
                      suggestion = decode['fert'] ;
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            suggestedfertilizer(recordName : suggestion)),
                      );
                    } ,



                    child : const Text ('Get Info' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 16,

                    ),
                    ),
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
