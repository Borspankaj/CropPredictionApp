
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
          title : const Text("KHETI"),
          centerTitle : true ,
          backgroundColor : Colors.lightGreen,
          // actions : <Widget> [ IconButton(onPressed: () {}, icon: const Icon(Icons.add_card_outlined))] ,
      ),
        body :
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center( child :
                Text(
                  textForPred ,
                  textAlign: TextAlign.center ,
                  style:
                  const TextStyle(
                    color : Colors.lime ,
                    fontFamily: 'FredokaOne',
                    fontSize: 30.0 ,
                 ),),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child : Text(
                    widget.recordName.toUpperCase() ,
                    textAlign: TextAlign.center ,
                    style: const TextStyle(
                      color : Colors.lime ,
                      fontFamily: 'FredokaOne',
                      fontSize: 30.0 ,
                ),) ,),
              ),

            ],
          )
      ),
    );
  }
}
