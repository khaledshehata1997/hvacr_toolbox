import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';

class RefrigeratorSearch extends StatefulWidget {
  RefrigeratorSearch() : super();

  @override
  RefrigeratorSearchState createState() => RefrigeratorSearchState();
}

class RefrigeratorSearchState extends State<RefrigeratorSearch> {
  Color color1=Colors.green;
  int current_step = 0;
  bool steper=true;


  @override

  Widget build(BuildContext context) {
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
        content: DefaultButton(text: 'SHOW REPORT',
          press: (){
            Navigator.pushNamed(context, 'RefrigeratorResult');
          },),
        isActive: true,
      ),
    ];

    return steper==true? Container(
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
                child: Stepper(
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

              ):
        Container(color: Colors.black,);
  }

}