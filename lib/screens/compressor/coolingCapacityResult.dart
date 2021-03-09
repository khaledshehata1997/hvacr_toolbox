
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/table.dart';
import 'package:provider/provider.dart';

class CoolingCapacityResult extends StatefulWidget{
  final String id;
  CoolingCapacityResult(this.id);

  @override
  _CoolingCapacityResultState createState() => _CoolingCapacityResultState();
}

class _CoolingCapacityResultState extends State<CoolingCapacityResult> {
  // final List<String> coulm1 = ["Brand" , "Model" , "Compressor type" , "Rate point temperature" , "Cooling capacity" , "Input Power" , "C.O.P" , "Running Current"];
  @override
  void initState(){
    coolingCapacityResult(widget.id);
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
  // final List<List<String>> colum2 = [[""],[""],[""],[""],["W","Kcal /Hr","BTU /Hr","TR","HP"],["W","HP"],[""],[""]];

  // final List<List<String>> colum3 = [["LG"],["QA114P"],["Rotary"],["7.2 / 54.4"],["1895","1629","6462","0.54","2.5"],["627","0.45"],["3.02"],["—"]];

  // final List<String> col1 = ["Brand" , "Model" , "Refrigerant" , "Voltage" , "Frequency" , "Motor type" , "Displacement" , "Oil type" , "Oil quantity" , "Main resistance" , "Strat resistance" , "Run capacitor" , "Start Capacitor" , "Locked current" , "Starting device" , "Motor protector" , "Capillary tube"];

  // final List<String> col2 = ["","","","V","Hz","","cm3","","gm","Ω","Ω","µF","µF","A","","","mm x mt"];

  // final List<String> col3 = ["LG","QA114P","R-22","220 - 240","50","- -","1.7","- -","D","- -","- -","- -","- -","- -","- -","- -","- -"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(context, "Compressors", true ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                  padding: EdgeInsets.all(10),
                  child: Text("*You've searched in Compressors $usagecount times today" , style:TextStyle(color: Colors.black54 , fontSize:17)),
                  ),
                  sambleTabelWidget(context, "Technical Data", performance, col1),
                  SizedBox(height:25),
                  sambleTabelWidget(context, "Technical Data", technical, col2)
                ],
              ),
            )
          
          ),
    );
  }
  coolingCapacityResult(String id) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/compressors/$id?choice=COOLING_CAPACITY";

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