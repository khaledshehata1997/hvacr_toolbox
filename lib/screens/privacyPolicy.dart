
import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
class PrivacyPolicy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:appbar(context,"privacy policy" , true),
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
                    Text("Nam dapibus nisl vitae elit fringilla rutrum. Aenean sollicitudin, erat a elementum rutrum, neque sem pretium metus, quis mollis nisl nunc et massa."
                    , style:TextStyle(
                      color:Colors.black45,
                      fontSize:width*0.05
                    )
                    ),
                    SizedBox(height: 30,),
                    Text("Nam dapibus nisl vitae elit fringilla rutrum."
                    , style:TextStyle(
                      color:Colors.black54,
                      fontSize:width*0.05
                    )
                    ),
                    SizedBox(height: 10,),
                    Text("Nam dapibus nisl vitae elit fringilla rutrum."
                    , style:TextStyle(
                      color:Colors.black54,
                      fontSize:width*0.05
                    )
                    ),
                    SizedBox(height: 10,),
                    Text("Nam dapibus nisl vitae elit fringilla rutrum."
                    , style:TextStyle(
                      color:Colors.black54,
                      fontSize:width*0.05
                    )
                    ),

                    SizedBox(height: 30,),
                    Text("Nam dapibus nisl vitae elit fringilla rutrum. Aenean sollicitudin, erat a elementum rutrum, neque sem pretium metus, quis mollis nisl nunc et massa."
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
