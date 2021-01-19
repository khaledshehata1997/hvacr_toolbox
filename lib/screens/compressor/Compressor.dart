


import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/CategoryBar.dart';
import 'package:hvacr_tool_box/widgets/Drawer.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';

import 'coolingCapacity.dart';

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
      body: Container(
        margin: EdgeInsets.only(top:50),  

        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Column(
          children: [
            CategoryBar(test, (){} , <Widget>[
            CoolingCapacity(),
            Container(color: Colors.green, height: 400,) ,
            Container(color: Colors.blue, height: 400,)]),
          ],
        )
      ),
    );
  }
}