
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';

class AirConditioner extends StatefulWidget {
  @override
  _AirConditionerState createState() => _AirConditionerState();
}

class _AirConditionerState extends State<AirConditioner> {
  Map result={'model':'ELS072S4ST','name':'lennox * Air Conditioning'};
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       serchBar((value){},'please enter compressor model '),
       Container(
           padding: EdgeInsets.all(15),
           width: MediaQuery.of(context).size.width * .87,
           height: MediaQuery.of(context).size.height *.65,
           margin: EdgeInsets.only(left: 15,right: 15),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Colors.white,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.25),
                 spreadRadius: 5,
                 blurRadius: 7,
                 offset: Offset(0, 3), // changes position of shadow
               ),
             ],
           ),
           child:ListView.builder(
             itemCount: 10,
             itemBuilder: (context, index) {
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Wrap(
                     direction: Axis.vertical,
                     spacing: 10,
                     children: [
                       Text('${result['model']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                       Text('${result['name']}',style: TextStyle(fontSize: 15,color:Colors.black45)),

                     ],
                   ),
                   Divider(height: 22,),
                 ],
               );
             },
           ) )
      ],
    );
  }
}
