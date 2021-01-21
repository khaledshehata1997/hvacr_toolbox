
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';

class CoolingCapacity extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        height:MediaQuery.of(context).size.height*0.7,
        padding: EdgeInsets.only(left:20 , right:20),
        child: ListView(
          children: [
            serchBar((val){
              print(val);
            } , "Please enter compressor model"),
            Container(
              height:150,
              width:MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Container(
              height:150,
              width:MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
            Container(
              height:150,
              width:MediaQuery.of(context).size.width,
              color: Colors.green,
            ),
          ],
        ),
    );
  }
}