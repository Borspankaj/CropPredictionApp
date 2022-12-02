import 'package:flutter/material.dart';
import 'dart:ui';


class suggestedfertilizer extends StatefulWidget {
  final String recordName ;
  const suggestedfertilizer({Key? key ,required this.recordName} ) : super(key: key);

  @override
  State<suggestedfertilizer> createState() => _suggestedfertilizerState();
}

class _suggestedfertilizerState extends State<suggestedfertilizer> {
  String remov(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: Scaffold(
        appBar:AppBar(
          title : const Text("Fertilizer" , style: TextStyle(
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
                    fit: BoxFit.cover),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0 , sigmaY: 3.0),
                child: SingleChildScrollView(
                  child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.00),
                              // color: const Color(0xFF50C878) ,

                            ),
                            child: Text(remov(widget.recordName.toUpperCase() ) ,textAlign: TextAlign.center,
                              style: const TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 20,

                            ),),


                            ),
                          ) ,
                        ),
                      ),


                  ),
                ),
              ),


    );
  }
}
