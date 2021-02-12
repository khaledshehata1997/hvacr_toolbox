import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/applications/refrigators.dart';
import 'package:hvacr_tool_box/screens/compressor/coolingCapacity.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/refregrator/refrigrator_search.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/washinng_machine/trouble_washing_machine.dart';
import 'package:hvacr_tool_box/widgets/CategoryBar.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';

import 'air_conditioners/residential_air_conditioners.dart';
import 'air_conditioners/trouble_air_conditioners.dart';
import 'archive/trouble_archive.dart';


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
        appBar: appbar(context, 'TROUBLESHOOTING', true),
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
                     SizedBox(height:15),
                    CategoryBar(test2, (){} , <Widget>[
                      TroubleAirConditioners(),
                      RefrigeratorSearch(),
                      WashingMachine(),
                      Archive()
                    ]),


                  ]),
            ),
          ],
        )
    );
  }
}
