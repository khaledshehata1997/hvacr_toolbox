import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';

class WashingMachine extends StatefulWidget {
  WashingMachine() : super();

  @override
  WashingMachineState createState() => WashingMachineState();
}

class WashingMachineState extends State<WashingMachine> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        elevation: 10,
                        color:Colors.white,
                        child: Text('Bearing code library',style: TextStyle(color: color1),),
                        onPressed: (){
                          setState(() {
                            color1=Colors.green;
                            color2 =Colors.black;
                          });

                        },
                      ),
                      RaisedButton(
                        elevation: 10,
                        color:Colors.white,
                        child: Text('Error code library',style: TextStyle(color: color2),),
                        onPressed: (){
                          setState(() {
                            color2=Colors.green;
                            color1 =Colors.black;

                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
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
                    child:color1==Colors.green? Stepper(
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
                    ):Stepper(
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
                    )

                  ),
                ],
              ),
    );
  }
}