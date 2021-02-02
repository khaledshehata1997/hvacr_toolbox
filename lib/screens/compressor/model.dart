import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';
import 'package:hvacr_tool_box/widgets/textOnFields.dart';

class CompressorModel extends StatefulWidget {
  CompressorModel() : super();

  @override
  CompressorModelState createState() => CompressorModelState();
}

class CompressorModelState extends State<CompressorModel> {
  Color color1=Colors.green;
  Color color2;
  int current_step = 0;
  List<Step> steps = [

    Step(
      title: Text('Select brand'),
      content: serchBar((value){},'Please select brand'),
      isActive:true,
    ),
    Step(
      state: StepState.complete,
      title: Text('Select error'),
      content: serchBar((value){},'Please select error'),
      isActive: true,
    ),
    Step(
      state: StepState.complete,
      title: Text('finish'),
      content: DefaultButton(text: 'SHOW REPORT',press: (){},),
      isActive: true,
    ),
  ];

  @override

  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textOnFields(context,'Cooling Capacity (W)',true),
                SizedBox(height: 15,),
                serchBar((value){},'Enter Cooling Capacity'),
                SizedBox(height: 15,),textOnFields(context,'Compressor type',true),
                SizedBox(height: 15,),
                serchBar((value){},'Enter Compressor type'),
                SizedBox(height: 15,),textOnFields(context,'Voltage',true),
                SizedBox(height: 15,),
                serchBar((value){},'Select Voltage'),
                SizedBox(height: 15,),textOnFields(context,'Frequency',true),
                SizedBox(height: 15,),
                serchBar((value){},'Select Frequency'),
                SizedBox(height: 15,),textOnFields(context,'Refrigerant',true),
                SizedBox(height: 15,),
                serchBar((value){},'Select Refrigerant'),
                SizedBox(height: 15,),textOnFields(context,'Application',true),
                SizedBox(height: 15,),
                serchBar((value){},'Select Application'),
                SizedBox(height: 15,),textOnFields(context,'Rate point temperature',true),
                SizedBox(height: 15,),
                serchBar((value){},'Select Rate point temperature'),
                SizedBox(height: 15,),
              ],
            )
            ),
          SizedBox(height: 20,),
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
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Choose brand and Model',style: TextStyle(fontSize: 19
                  ,color: Colors.green,fontWeight:FontWeight.bold ),),
                  Stepper(
                    currentStep: this.current_step,
                    steps: steps,
                    type: StepperType.vertical,
                    onStepTapped: (step) {
                      setState(() {
                        current_step = step;

                      });
                    },
                    onStepContinue: () {
                      setState(() {
                        if (current_step < steps.length - 1) {
                          current_step = current_step + 1;
                        } else {
                          current_step = 0;
                        }
                      });
                      if(current_step==steps.length){

                      }
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
              )

          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }
}