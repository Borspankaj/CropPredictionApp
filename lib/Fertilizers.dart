import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
import 'suggestedfertilizer.dart';
import 'dart:ui';
const List<String> list = <String>['rice', 'maize', 'chickpea', 'kidneybeans', 'pigeonpeas',
  'mothbeans', 'mungbean', 'blackgram', 'lentil', 'pomegranate',
  'banana', 'mango', 'grapes', 'watermelon', 'muskmelon', 'apple',
  'orange', 'papaya', 'coconut', 'cotton', 'jute', 'coffee'];
class Fertilizer extends StatefulWidget {
  const Fertilizer({Key? key}) : super(key: key);

  @override
  State<Fertilizer> createState() => _FertilizerState();
}

class _FertilizerState extends State<Fertilizer> {

  double _n = 0.0 ;
  double _p = 0.0 ;
  double _k = 0.0 ;

  String _crop = list.first ;
  var suggestion = " ";

  var decode ;
  // var values = {"crop" : "" ,
  //   "nitrogen" : "" ,
  // "phosphorus" : "" ,
  // "potassium" : "" , };
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
                              // values['nitrogen'] = '$value';
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
                              // values['phosphorus'] = '$value';
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
                              // values['potassium'] = '$value';
                            });
                          },
                        ),
                      ),
                    ]
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
                      var params = '$_crop ${_n.round()} ${_p.round()} ${_k.round()}' ;
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



                    child : const Text ('Submit' , style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 16,

                    ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: 200,
              //     height: 50,
              //     child: ElevatedButton(
              //       style : ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF50C878)),
              //           foregroundColor: MaterialStateProperty.all<Color>(Colors.white) ,
              //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //               const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.00)))),
              //           shadowColor: MaterialStateProperty.all<Color>(Colors.white)
              //       ),
              //       onPressed: ()
              //       {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) =>
              //               suggestedfertilizer(recordName : suggestion)),
              //         );
              //
              //       } ,
              //
              //
              //
              //       child : const Text ('Get Suggestion' ,
              //         style: TextStyle(
              //           fontFamily: 'BebasNeue',
              //           fontSize: 16,
              //
              //         ),),
              //     ),
              //   ),
              // ),



            ]
            ),
          ),
        ),
      ),

    ),
    );
  }
}
