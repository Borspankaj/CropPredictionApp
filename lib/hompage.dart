import 'dart:ui';

import 'package:flutter/material.dart';
import 'Prediction.dart';
import '';
import 'Fertilizers.dart';
import 'iotdevicedata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false, home: Scaffold(
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
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(

                image: AssetImage("assets/predic.jpg"),
                fit: BoxFit.cover),
          ),


          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0 , sigmaY: 3.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(


                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center
                    ,children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            height: 250,
                            child: ElevatedButton(
                                style : ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF50C878)),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white) ,
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.00)))),
                                    shadowColor: MaterialStateProperty.all<Color>(Colors.white)
                                ),

                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (details) => const Iotdevice()),
                                );}, child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('lib/icons/cpu.png', scale : 7 ,) ,
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Get Prediction from device', style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'BebasNeue' ,
                            ),
                              textAlign: TextAlign.center,),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                            width: 200,
                            height: 100,
                            color: Color(0xFF009970),
                            child: Column(
                              children: const [

                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Connect the IOT device !' ,
                                    style: TextStyle(
                                      fontSize: 18 ,
                                      fontFamily: 'Dosis' ,
                                      fontWeight: FontWeight.bold ,
                                      color: Colors.white,
                                    ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Get prediction on One Tap !' ,
                                    style: TextStyle(
                                      fontSize: 18 ,
                                      fontFamily: 'Dosis' ,
                                      fontWeight: FontWeight.bold ,
                                      color: Colors.white,
                                    ),),
                                )
                              ],
                            ),

                          ),
                        ],
                      ),
                    ) ,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(

                            width: 200,
                            height: 100,
                            color: Color(0xFF009970),
                            child: Column(
                              children: const [

                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('You want crop of your choice ? !' , style: TextStyle(
                                    fontSize: 18 ,
                                    fontFamily: 'Dosis' ,
                                    fontWeight: FontWeight.bold ,
                                    color: Colors.white,
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Get soil mixtures according for your soil .',
                                    style: TextStyle(
                                      fontSize: 18 ,
                                      fontFamily: 'Dosis' ,
                                      fontWeight: FontWeight.bold ,
                                      color: Colors.white,
                                    ),),
                                )
                              ],
                            ),

                          ),
                          SizedBox(
                            width: 250,
                            height: 250,
                            child: ElevatedButton(
                                style : ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF50C878)),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white) ,
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.00)))),
                                    shadowColor: MaterialStateProperty.all<Color>(Colors.white)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (details) => const Fertilizer()),
                                );} ,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('lib/icons/fertilizer.png' , scale: 6,) ,
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Crop you wanna grow ? ' ,style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'BebasNeue' ,
                                      ),
                                        textAlign: TextAlign.center,),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ) ,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            height: 250,

                            child: ElevatedButton(
                              style : ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF50C878)),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white) ,
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.00)))),
                                  shadowColor: MaterialStateProperty.all<Color>(Colors.white)
                              ),
                              onPressed: () { Navigator.push(
                                context,
                                MaterialPageRoute(builder: (details) => const Home()),
                              );} ,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/icons/agriculture.png' , scale: 7,) ,
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Already have soil info ?' ,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'BebasNeue' ,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 100,
                            color: Color(0xFF009970),
                            child: Column(
                              children: const [

                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Have your Own Info !' , style: TextStyle(
                                    fontSize: 18 ,
                                    fontFamily: 'Dosis' ,
                                    fontWeight: FontWeight.bold ,
                                    color: Colors.white,
                                  ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Get prediction on One Tap !' ,style: TextStyle(
                                    fontSize: 18 ,
                                    fontFamily: 'Dosis' ,
                                    fontWeight: FontWeight.bold ,
                                    color: Colors.white,
                                  ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        ],
                      ),
                    ) ,
    ],
                  ),
                ),
              ),
          ),
          ),
        ),

    );
  }
}
