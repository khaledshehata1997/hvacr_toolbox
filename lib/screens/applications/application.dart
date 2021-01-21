import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/compressor/coolingCapacity.dart';
import 'package:hvacr_tool_box/widgets/CategoryBar.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';

import 'air_conditioner.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  List<String> test2 = ['AIR CONDITIONERS', 'Refrigerator', 'Commercial refrigerators'] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: appbar(context, 'APPLICATIONS', true),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top:50),

            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                CategoryBar(test2, (){} , <Widget>[

                  AirConditioner(),
                  Container(color: Colors.blue, height: 400,),
                Container(color: Colors.red, height: 400,),
          ]),


              ]),
              ),
        ],
      )
    );
  }
}
