
import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
class Terms extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:appbar(context,"Terms and Condetions" , true),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
                  child: Column(
            children:<Widget>[
              SizedBox(height: 60,),
              Center(child: Image(image: AssetImage("logos/logo_h.png"), width: width*0.7)),
              SizedBox(height: 40,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.9,
                child: Column(
                  children: [
                    Text("Nam dapibus nisl vitae elit fringilla rutrum. Aenean sollicitudin, erat a elementum rutrum, neque sem pretium metus, quis mollis nisl nunc et massa. Vestibulum sed metus in lorem tristique ullamcorper id vitae erat. Nulla mollis sapien sollicitudin lacinia lacinia. Vivamus facilisis dolor et massa placerat, at vestibulum nisl egestas. Nullam rhoncus lacus non odio luctus, eu condimentum mauris ultrices. Praesent blandit, augue a posuere aliquam, arcu tortor feugiat turpis, quis lacinia augue sapien at tellus. Cras ut erat magna. Morbi nibh ante, condimentum vestibulum tempus a, tristique et velit. Sed semper aliquet ante. Quisque tempus arcu sapien, id convallis turpis dictum quis. Nunc commodo vitae risus sit amet sollicitudin. Sed id facilisis sem."
                    , style:TextStyle(
                      color:Colors.black45,
                      fontSize:width*0.05
                    )
                    ),
                    SizedBox(height: 60,),
                  ],
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}
