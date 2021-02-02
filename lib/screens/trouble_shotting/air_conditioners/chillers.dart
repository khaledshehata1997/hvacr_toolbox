import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';

class Chillers extends StatefulWidget {
  Chillers() : super();

  @override
  ChillersState createState() => ChillersState();
}

class ChillersState extends State<Chillers> {
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

    return Scaffold(
      appBar: appbar(context, 'TROUBLESHOOTING', true),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Chiller" ,
                      style:TextStyle(color: Colors.green , fontSize:17,fontWeight: FontWeight.bold)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        elevation: 10,
                        color:Colors.white,
                        child: Text('Error code library',style: TextStyle(color: color1),),
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
                        child: Text('Diagnostics',style: TextStyle(color: color2),),
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
                    ):
                    Column(
                      children: [
                        diagnostic(),
                        diagnostic(),
                        diagnostic(),
                        diagnostic(),
                        diagnostic(),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget diagnostic(){
    return Container(
      margin: EdgeInsets.all(15),
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
      padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Folder',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
          DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black45),
            onChanged: (value) {

            },
            items: <String>['Sub Folder', 'Sub Folder', 'Sub Folder', 'Sub Folder']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Column(
                  children: [
                    RaisedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value,style: TextStyle(fontSize: 18),),
                          Icon(Icons.arrow_forward_outlined,size: 30,)
                        ],
                      ),
                      onPressed: (){},
                      color: Colors.white,
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}