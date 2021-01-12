import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  var hint;
  var obScur;
  var validate;

  CustomTextForm( var obScur, var validate){
    this.obScur=obScur;
    this.validate=validate;

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
      child: TextFormField(
        obscureText: obScur,
          validator: (value){
            if (value.isEmpty)
              return '$validate';
          },
          onSaved: (value){

          },
          cursorColor:Colors.green ,
          decoration: InputDecoration(
            contentPadding: new EdgeInsets.symmetric(vertical: .01, horizontal: 5.0),

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    width: 1,
                    style:BorderStyle.values[1],
                    color: Colors.black45
                )
            ),
            errorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    width: 3,
                    style:BorderStyle.values[1],
                    color: Colors.black45
                )
            ),

            focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Colors.black45
                )
            ),

          )
      ),
    ) ;
  }
}
