import 'dart:ui';
import 'package:flutter/material.dart';

class PredictedCrop extends StatefulWidget {
  final String recordName ;
  const PredictedCrop({Key? key , required this.recordName }) : super(key: key);

  @override
  State<PredictedCrop> createState() => _PredictedCropState();
}

class _PredictedCropState extends State<PredictedCrop> {

  String textForPred = " The suitable crop for your farm " ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title : const Text("Predicted Crop" , style: TextStyle(
            fontFamily: 'BebasNeue' ,
            color: Colors.black ,
          )),
          centerTitle : true ,
          backgroundColor : const Color(0xFF50C878),
          // actions : <Widget> [ IconButton(onPressed: () {}, icon: const Icon(Icons.add_card_outlined))] ,
        ),
        body :
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(

                  image: AssetImage("assets/predic.jpg"),
                  fit: BoxFit.fill),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0 , sigmaY: 3.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Center( child :
                      Text(
                        textForPred ,
                        textAlign: TextAlign.center ,
                        style:
                        const TextStyle(
                          shadows: <Shadow>[Shadow(
                            offset: Offset(3, 3),
                            blurRadius: 16.0,
                            color: Colors.black,
                          )],
                          color : Colors.white ,
                          fontFamily: 'BebasNeue',
                          fontSize: 35.0 ,
                       ),),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color : const Color(0xFF50C878) ,
                        borderRadius: BorderRadius.circular(50.00),

                      ),
                      width: 300,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child : Text(
                            widget.recordName.toUpperCase() ,
                            textAlign: TextAlign.center ,
                            style: const TextStyle(
                              color : Colors.white ,
                              fontFamily: 'BebasNeue',
                              fontSize: 50.0 ,
                        ),) ,),
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
