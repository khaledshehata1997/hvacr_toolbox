import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/applications/refrigators.dart';
import 'package:hvacr_tool_box/screens/compressor/coolingCapacity.dart';
import 'package:hvacr_tool_box/widgets/CategoryBar.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';

import 'air_conditioners.dart';


class TroubleShooting extends StatefulWidget {
  @override
  _TroubleShootingState createState() => _TroubleShootingState();
}

class _TroubleShootingState extends State<TroubleShooting> {
  List<String> test2 = ['AIR CONDITIONERS', 'Refrigerator', 'Washing Machine','Archive'] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: appbar(context, 'TROUBLE SHOOTING', true),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*.02),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text("*You've searched in Air Conditioners 0 times today and you've 3 times left" , style:TextStyle(color: Colors.black54 , fontSize:17)),
                    ),
                     SizedBox(height:20),
                    CategoryBar(test2, (){} , <Widget>[
                      TroubleAirConditioners(),
                      Container(color: Colors.blue,),
                      Container(color: Colors.black,),
                      Container(color: Colors.black,),
                    ]),


                  ]),
            ),
          ],
        )
    );
  }
}
