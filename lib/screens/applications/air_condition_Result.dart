import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/table.dart';
import 'package:provider/provider.dart';

class AirConditionResult extends StatefulWidget {
  //for complex table
  final String model;
  final String id;
  AirConditionResult(this.id, this.model);

  @override
  _AirConditionResultState createState() => _AirConditionResultState();
}

class _AirConditionResultState extends State<AirConditionResult> {
  void initState() {
    airConditionResult(widget.id);
    super.initState();
  }
  List compressros = [];
  String usagecount = "";
  List<String> col1 = [];
  List<String> airConditioner = [
    "brand",
    "model",
    "application_type",
    "voltage_frequency_v_per_hz",
    "current_a",
    "input_power_w",
    "refrigerant",
    "refrigerant_charge_gm",
    "application",
    "cooling_capacity_btu_per_hr",
    "cooling_capacity_w",
    "cooling_capacity_tr",
    "capillary_tube"
  ];
  List<String> compressor = [
    "brand",
    "model",
    "refrigerant",
    "application",
    "voltage_frequency_v_hz",
    "capacity_w",
    "cooling_capacity_btu_per_hr",
    "overload",
    "run_capacitor",
    "start_capacitor",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, "${widget.model}", true),
      body: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "*You've searched in Air_Conditions $usagecount times today",
                      style: TextStyle(color: Colors.black54, fontSize: 17)),
                ),
                sambleTabelWidget(
                    context, "Air Condition Data", airConditioner, col1),
                    SizedBox(height: 15,),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                itemCount:compressros.length ,
                itemBuilder: (context , index){
                  List<String> cool = [];
                  for (var i = 0; i < compressor.length; i++) {
                  cool.add(
                  (compressros[index][compressor[i]]).toString() == "null"? "": (compressros[index][compressor[i]]).toString());
                  
            }
            return Column(
              children: [
                SizedBox(height: 15,),
                sambleTabelWidget(
                        context, "Compressor Data", compressor, cool),
              ],
            );
            })
              ]
            ),
          )),
    );
  }

  airConditionResult(String id) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url =
          "https://api.hvacrtoolbox.com/api/applications/air-conditioners/$id/get";

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
        for (var i = 0; i < airConditioner.length; i++) {
          col1.add(
              (data["air_conditioner"][airConditioner[i]]).toString() == "null"
                  ? ""
                  : (data["air_conditioner"][airConditioner[i]]).toString());
        }
        compressros = data["air_conditioner"]["compressors"];
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
}
