
import'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediQuery =MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context , 'SETTINGS',true),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all( 20),
            padding: EdgeInsets.all(10),
            width: mediQuery.width * .9,
            height: mediQuery.height * .21,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.language,color: Colors.green,size: 27,),
                    SizedBox(width: mediQuery.width*.04,),
                    Text('Languages',style: TextStyle(fontSize: 22),)
                  ],
                ),
               SizedBox(height: 10,),
               Container(
                 margin: EdgeInsets.only(left: 22),
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Radio(

                         ),
                         Text('Arabic',style: TextStyle(fontSize: 20),)
                       ],
                     ),
                     Row(
                       children: [
                         Radio(

                         ),
                         Text('English',style: TextStyle(fontSize: 20),)
                       ],
                     )
                   ],
                 ),
               )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: DefaultButton(text: 'SAVE CHANGES',
            press: (){

            },
            ),
          )
        ],
      ),


    );
  }
}

