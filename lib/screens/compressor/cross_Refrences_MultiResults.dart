

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/table.dart';
import 'package:hvacr_tool_box/widgets/textOnFields.dart';
import 'package:provider/provider.dart';

import 'cross_reference_result.dart';

class CrossReferenceMultiRuslts extends StatefulWidget{
  final String id ;
  final String name;
  CrossReferenceMultiRuslts(this.id , this.name);
  @override
  _CrossReferenceMultiRusltsState createState() => _CrossReferenceMultiRusltsState();
}

class _CrossReferenceMultiRusltsState extends State<CrossReferenceMultiRuslts> {
  @override
  void initState(){
    crossRefrenceResult(widget.id);
    super.initState();
  }

  String usagecount = "";
  List<String> performance = [
        "brand",
        "model",
        "compressor_type",
        "application",
        "voltage_per_frequency",
        "rate_point_temperature",
        "capacity_w",
        "capacity_kcal_per_hour",
        "capacity_btu_per_hr",
        "capacity_tr",
        "capacity_hp",
        "input_power_w",
        "input_power_hp",
        "cop_ww",
        "running_current_a"
    ];
    List<String> col1=[];
    List<String> col2=[];
    List<String> technical = [
        "model",
        "brand",
        "refrigerant",
        "application",
        "voltage_per_frequency",
        "frequency",
        "motor_type",
        "displacement_cm3",
        "oil_type",
        "oil_quantity_gm",
        "main_resistance",
        "start_resistance",
        "capacitor_run",
        "capacitor_start",
        "locked_current_a",
        "starting_device",
        "overload",
        "capillary_tube"
    ];
  Map results ={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color(0xffffffff),
          appBar: appbar(context, "${widget.name}", true ),
          body: Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text("*You've searched in Compressors $usagecount times today" , style:TextStyle(color: Colors.black54 , fontSize:17)),
                    ),
                  sambleTabelWidget(context, "Technical Data", performance, col1),
                  SizedBox(height:25),
                  sambleTabelWidget(context, "Technical Data", technical, col2),
                  SizedBox(height:25),
                  Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 10 , top: 10),
          child: textOnFields(context, "Similar Compressors", true)),
                  ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: results.length ,
                  itemBuilder: (context,index){
                    List resultsKey = results.keys.toList();
                    List resultsValues = results.values.toList();
                    return similiar(resultsKey[index] , resultsValues[index]);
                  })
                ],
              ),
            ),
          )
    );
  }

  crossRefrenceResult(String id) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/compressors/$id?choice=CROSS_REFERENCE";

      var request = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
        );
      print(request.body);
      var data = jsonDecode(request.body);
      
      if ("${data['success']}" == "true") {
        for (var i = 0; i < technical.length; i++) {
          col2.add((data["compressor"][technical[i]]).toString()=="null"?"":(data["compressor"][technical[i]]).toString());
        }
        for (var i = 0; i < performance.length; i++) {
          col1.add((data["compressor"][performance[i]]).toString()=="null"?"":(data["compressor"][performance[i]]).toString());
        }
        results = data["compressor"]["similar_compressors"];
        print(results);
        setState(() {
         usagecount = "${data["usage"][0]["usage_count"]}";
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

  Widget similiar(String tableTitle , List result){
    result = result??[]; 
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 10, top: 10),
          child: textOnFields(context, "$tableTitle", true)),
        Container(
                padding: EdgeInsets.only(left: 10,right: 10 , top: 10),
                width: MediaQuery.of(context).size.width * .9,
                // height: MediaQuery.of(context).size.height *.3,
                margin: EdgeInsets.only(left: 10,right: 10 , bottom: 10),
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
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        List<String> coll1 = [];
                        List<String> coll2 = [];
                        for (var i = 0; i < technical.length; i++) {
                        coll2.add((result[index][technical[i]]).toString()=="null"?"":(result[index][technical[i]]).toString());
                        }
                        for (var i = 0; i < performance.length; i++) {
                          coll1.add((result[index][performance[i]]).toString()=="null"?"":(result[index][performance[i]]).toString());
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CrossReferencrResult(usagecount ,coll1, coll2 , '${result[index]['model']}') ));
                      },
                                     child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            direction: Axis.vertical,
                            spacing: 10,
                            children: [
                              Text('${result[index]['model']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text('${result[index]['brand']} * ${result[index]['refrigerant']} * ${result[index]['voltage_per_frequency']} * ${result[index]['application']}',style: TextStyle(fontSize: 15,color:Colors.black45)),
                            ],
                          ),
                          Divider(height: 20,),
                        ],
                      ),
                    );
                  },
                ) ),
      ],
    );
  }
  
}
  