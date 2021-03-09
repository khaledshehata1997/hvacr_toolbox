import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:hvacr_tool_box/widgets/dropDown.dart';
import 'package:hvacr_tool_box/widgets/textOnFields.dart';
import 'package:provider/provider.dart';

import 'modelResult.dart';

class CompressorModel extends StatefulWidget {
  CompressorModel() : super();

  @override
  CompressorModelState createState() => CompressorModelState();
}

class CompressorModelState extends State<CompressorModel> {
  Color color1 = Colors.green;
  Color color2;
  int current_step = 0;
  String selectBrand = "";
  String selectModel = "";
  final _formKey = GlobalKey<FormState>();
  List<String> brands = [""];
  List<String> models = [""];
   String capacityw,
    compressortype,
    refrigerant,
    application,
    voltageperfrequency,
    ratepointtemperature;
  TextEditingController coolingCapacityController = TextEditingController();
  TextEditingController compressortypeController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController refrigerantController = TextEditingController();
  TextEditingController applicationController = TextEditingController();
  TextEditingController ratePointTemperatureController =
      TextEditingController();
  String dropdownValue = 'One';

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
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textOnFields(context, 'Cooling Capacity (W)', true),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(
                      false,
                      'Enter Cooling Capacity',
                      controller: coolingCapacityController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    textOnFields(context, 'Compressor type', true),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(false, 'Enter Compressor type',
                        controller: compressortypeController),
                    SizedBox(
                      height: 15,
                    ),
                    textOnFields(context, 'Voltage', true),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(false, 'Select Voltage',
                        controller: voltageController),
                    SizedBox(
                      height: 15,
                    ),
                    textOnFields(context, 'Frequency', true),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(false, 'Select Frequency',
                        controller: frequencyController),
                    SizedBox(
                      height: 15,
                    ),
                    textOnFields(context, 'Refrigerant', true),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(false, 'Select Refrigerant',
                        controller: refrigerantController),
                    SizedBox(
                      height: 15,
                    ),
                    textOnFields(context, 'Application', true),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(false, 'Select Application',
                        controller: applicationController),
                    SizedBox(
                      height: 15,
                    ),
                    textOnFields(context, 'Rate point temperature', true),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(false, 'Select Rate point temperature',
                        controller: ratePointTemperatureController),
                    SizedBox(
                      height: 15,
                    ),
                    DefaultButton(
                      text: 'Get Models',
                      press: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        capacityw = coolingCapacityController.text.trim();
                        compressortype = compressortypeController.text.trim();
                        refrigerant = refrigerantController.text.trim();
                        application = applicationController.text.trim();
                        ratepointtemperature = ratePointTemperatureController.text;
                        voltageperfrequency = voltageController.text + " / " + frequencyController.text;

                        getBrands(capacityw, compressortype, refrigerant, application, voltageperfrequency, ratepointtemperature);

                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.all(13),
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose brand and Model',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Stepper(
                    currentStep: this.current_step,
                    steps: <Step>[
                      Step(
                        title: Text('Select brand'),
                        content: dropDown((value) {
                        setState(() {
                          selectBrand = value;
                        });
                        }, brands, context,selectBrand),
                        isActive: true,
                      ),
                      Step(
                        state: StepState.complete,
                        title: Text('Select model'),
                        content: dropDown((value) {
                          setState(() {
                            selectModel = value;
                          });
                        }, models, context ,selectModel ),
                        isActive: true,
                      ),
                      Step(
                        state: StepState.complete,
                        title: Text('finish'),
                        content: DefaultButton(
                          text: 'SHOW REPORT',
                          press: () {
                            getResult(capacityw, compressortype, refrigerant, application, voltageperfrequency, ratepointtemperature, selectBrand, selectModel);
                          },
                        ),
                        isActive: true,
                      ),
                    ],
                    type: StepperType.vertical,
                    onStepTapped: (step) {
                      
                      setState(() {
                        current_step = step;
                      });

                    },
                    onStepContinue: () {
                      if (current_step == 0 && selectBrand != "") {
                        getModls(capacityw, compressortype, refrigerant, application, voltageperfrequency, ratepointtemperature, selectBrand);
                      }
                      setState(() {
                        if (current_step < 3 - 1) {
                          current_step = current_step + 1;
                        } else {
                          current_step = 0;
                        }
                      });
                      if (current_step == 3) {}
                    },
                    onStepCancel: () {
                      setState(() {
                        if (current_step > 0) {
                          current_step = current_step - 1;
                        } else {
                          current_step = 0;
                        }
                      });
                    },
                  ),
                ],
              )),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
  getBrands(String capacityw , String compressortype , String refrigerant , String application , String voltageperfrequency , String ratepointtemperature , ) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/compressors/model/brands";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
        body:
            jsonEncode(<String, String>{
              "capacity_w": capacityw,
              "compressor_type": compressortype,
              "refrigerant": refrigerant,
              "application": application,
              "voltage_per_frequency": voltageperfrequency,
              "rate_point_temperature": ratepointtemperature
              }),
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        List br = data['brands'];
        for (var i = 0; i < br.length ; i++) {
          brands.add(br[i]);
        }
        setState(() {
          brands=brands;
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

  getModls(String capacityw , String compressortype , String refrigerant , String application , String voltageperfrequency , String ratepointtemperature , String brand ) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/compressors/model/models";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
        body:
            jsonEncode(<String, String>{
              "capacity_w": capacityw,
              "compressor_type": compressortype,
              "refrigerant": refrigerant,
              "application": application,
              "voltage_per_frequency": voltageperfrequency,
              "rate_point_temperature": ratepointtemperature,
              "brand": brand
              }),
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        List br = data['brands'];
        for (var i = 0; i < br.length ; i++) {
          models.add(br[i]);
        }
        setState(() {
          models=models;
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

  getResult(String capacityw , String compressortype , String refrigerant , String application , String voltageperfrequency , String ratepointtemperature , String brand , String model ) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/compressors/model/result";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
        body:
            jsonEncode(<String, String>{
              "capacity_w": capacityw,
              "compressor_type": compressortype,
              "refrigerant": refrigerant,
              "application": application,
              "voltage_per_frequency": voltageperfrequency,
              "rate_point_temperature": ratepointtemperature,
              "brand": brand,
              "model": model
              }),
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        List result = data['brands'];
        List<String> coll1 = [];
        List<String> coll2 = [];
        for (var i = 0; i < technical.length; i++) {
        coll2.add((result[0][technical[i]]).toString()=="null"?"":(result[0][technical[i]]).toString());
        }
        for (var i = 0; i < performance.length; i++) {
          coll1.add((result[0][performance[i]]).toString()=="null"?"":(result[0][performance[i]]).toString());
        }
       String usagecount = "${data["usage"][0]["usage_count"]}";
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ModelResult(usagecount ,coll1, coll2 , '${data["brands"][0]['model']}') ));


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
