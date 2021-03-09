
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';
import 'package:provider/provider.dart';

import 'air_condition_Result.dart';

class AirConditioner extends StatefulWidget {
  @override
  _AirConditionerState createState() => _AirConditionerState();
}

class _AirConditionerState extends State<AirConditioner> {
  List result= [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       serchBar((value){
         search(context, value);
       },'please enter AirCondition model '),
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
             itemCount: result.length,
             itemBuilder: (context, index) {
               return GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> AirConditionResult("${result[index]['id']}", '${result[index]['model']}' )));
                 },
                   child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Wrap(
                         direction: Axis.vertical,
                         spacing: 10,
                         children: [
                           Text('${result[index]['model']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                           Text('${result[index]['brand']} * ${result[index]['application_type']}',style: TextStyle(fontSize: 15,color:Colors.black45)),
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
  search(context , String serch) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/applications/air-conditioners/search";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
        body:jsonEncode(<String, String>{
          "query": "$serch"
        }
      ));
      print(request.body);
      var data = jsonDecode(request.body);
      
      if ("${data['success']}" == "true") {
        setState(() {
         result = data["air_conditioners"];
        });
        alertTost("${data["message"]}");
        
      } else {
        alertTost("${data["message"]}");
        
      }
    } catch (e) {
      alertTost("Error From Server or Network");
      print(e);
    }
  }
}
