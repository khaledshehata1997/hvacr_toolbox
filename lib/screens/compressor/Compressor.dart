


import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/CategoryBar.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';

import 'coolingCapacity.dart';
import 'cross_reference.dart';
import 'model.dart';

class Compressor extends StatefulWidget{
  @override
  _CompressorState createState() => _CompressorState();
}

class _CompressorState extends State<Compressor> {
  List<String> test = ["Cooling capacity" , "Cross reference" , "model"] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: appbar(context, "Compressors", true ),
      body: ListView(
        children: [
          Container(
            //margin: EdgeInsets.only(top:5),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child:SingleChildScrollView(
                      child: Column(
                children: [

                  CategoryBar(test, (){} , <Widget>[
                  CoolingCapacity(),
                    CrossReference(),
                    CompressorModel()
                  ]),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}