

import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/compressor/coolingCapacityResult.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';

class CoolingCapacity extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Map result={'model':'QA114P','name':'LG * R- 22* 220 V / 50 Hz * AC'};
    return Column(
      children: [
       serchBar((value){},'please enter compressor model '),
       Container(
           padding: EdgeInsets.all(15),
           width: MediaQuery.of(context).size.width * .9,
           height: MediaQuery.of(context).size.height *.65,
           margin: EdgeInsets.only(left: 10,right: 10),
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
               return GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> CoolingCapacityResult() ));
                 },
                                child: Column(
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
                 ),
               );
             },
           ) )
      ],
    );
  }
}