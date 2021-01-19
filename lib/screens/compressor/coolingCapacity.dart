
import 'package:flutter/material.dart';

class CoolingCapacity extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        height:MediaQuery.of(context).size.height*0.7,
        padding: EdgeInsets.only(left:20 , right:20),
        child: ListView(
          children: [
            Container(
              height:150,
              width:MediaQuery.of(context).size.width,
              color: Colors.red,
            ),
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