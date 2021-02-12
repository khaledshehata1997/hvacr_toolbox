import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/table.dart';

class CrossReferencrResult extends StatelessWidget{
  //for complex table
  final List<String> coulm1 = ["Brand" , "Model" , "Compressor type" , "Rate point temperature" , "Cooling capacity" , "Input Power" , "C.O.P" , "Running Current"];
  final List<List<String>> colum2 = [[""],[""],[""],[""],["W","Kcal /Hr","BTU /Hr","TR","HP"],["W","HP"],[""],[""]];
  final List<List<String>> colum3 = [["LG"],["QA114P"],["Rotary"],["7.2 / 54.4"],["1895","1629","6462","0.54","2.5"],["627","0.45"],["3.02"],["—"]];
  // for samble table
  final List<String> col1 = ["Brand" , "Model" , "Refrigerant" , "Voltage" , "Frequency" , "Motor type" , "Displacement" , "Oil type" , "Oil quantity" , "Main resistance" , "Strat resistance" , "Run capacitor" , "Start Capacitor" , "Locked current" , "Starting device" , "Motor protector" , "Capillary tube"];
  final List<String> col2 = ["","","","V","Hz","","cm3","","gm","Ω","Ω","µF","µF","A","","","mm x mt"];
  final List<String> col3 = ["LG","QA114P","R-22","220 - 240","50","- -","1.7","- -","D","- -","- -","- -","- -","- -","- -","- -","- -"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, "Compressors", true ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                complexTabelWidget(context , "Performance" , coulm1 , colum2 , colum3),
                SizedBox(height:25),
                sambleTabelWidget(context, "Technical Data", col1, col2, col3)
              ],
            ),
          )

      ),
    );
  }
}