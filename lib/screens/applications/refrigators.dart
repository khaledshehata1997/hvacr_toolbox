import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';
import 'package:hvacr_tool_box/widgets/table.dart';

class Refrigators extends StatefulWidget {
  @override
  _RefrigatorsState createState() => _RefrigatorsState();
}

class _RefrigatorsState extends State<Refrigators> {
  final List<String> coulm1 = ["Brand" , "Model" , "Compressor type" , "Rate point temperature" , "Cooling capacity" , "Input Power" , "C.O.P" , "Running Current"];
  final List<List<String>> colum2 = [[""],[""],[""],[""],["W","Kcal /Hr","BTU /Hr","TR","HP"],["W","HP"],[""],[""]];
  final List<List<String>> colum3 = [["LG"],["QA114P"],["Rotary"],["7.2 / 54.4"],["1895","1629","6462","0.54","2.5"],["627","0.45"],["3.02"],["—"]];

  final List<String> coulm11 = ["Brand" , "Model" , "Compressor type" , "Rate point temperature" , "Cooling capacity" , "Input Power" , "C.O.P" , "Running Current"];
  final List<List<String>> colum22 = [[""],[""],[""],[""],["W","Kcal /Hr","BTU /Hr","TR","HP"],["W","HP"],[""],[""]];
  final List<List<String>> colum33 = [["LG"],["QA114P"],["Rotary"],["7.2 / 54.4"],["1895","1629","6462","0.54","2.5"],["627","0.45"],["3.02"],["—"]];  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        serchBar((value){},'please enter compressor model '),
        Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  complexTabelWidget(context , "Air Conditioner Specification" , coulm1 , colum2 , colum3),
                  SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 10),
                      alignment: Alignment.topLeft,
                      child: Text('Matching Compressors Specification:',style: TextStyle(
                        fontSize: 16,color:Colors.green,fontWeight: FontWeight.bold,),)),

                  complexTabelWidget(context , "" , coulm11 , colum22 , colum33),



                ],
              ),
            )

        ),
      ],
    );
  }
}
