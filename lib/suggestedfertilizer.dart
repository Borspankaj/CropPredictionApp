import 'package:flutter/material.dart';

class suggestedfertilizer extends StatefulWidget {
  final String recordName ;
  const suggestedfertilizer({Key? key ,required this.recordName} ) : super(key: key);

  @override
  State<suggestedfertilizer> createState() => _suggestedfertilizerState();
}

class _suggestedfertilizerState extends State<suggestedfertilizer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar:AppBar(
        title : const Text("KHETI"),
    centerTitle : true ,
    backgroundColor : Colors.lightGreen,
    // actions : <Widget> [ IconButton(onPressed: () {}, icon: const Icon(Icons.add_card_outlined))] ,
    ),
            body :
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center( child :
                      Text(
                      'Suggested Fertilizer' ,
                      textAlign: TextAlign.center ,
                      style:
                        TextStyle(
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
              ),
            )
    ),
    );
  }
}
