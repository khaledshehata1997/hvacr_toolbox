import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/table.dart';

class ModelResult extends StatefulWidget{
  //for complex table
  final String model;
  final String usagecount;
  final List<String> col1;
  final List<String> col2;
  ModelResult(this.usagecount , this.col1 , this.col2 , this.model);


  @override
  _ModelResultState createState() => _ModelResultState();
}

class _ModelResultState extends State<ModelResult> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, "${widget.model}", true ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text("*You've searched in Compressors ${widget.usagecount} times today" , style:TextStyle(color: Colors.black54 , fontSize:17)),
                  ),
                  sambleTabelWidget(context, "Technical Data", performance, widget.col1),
                  SizedBox(height:25),
                  sambleTabelWidget(context, "Technical Data", technical, widget.col2)
              ],
            ),
          )

      ),
    );
  }
}