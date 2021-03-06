import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  var obScur;
  var validate;
  var controller;
  bool isNarrow;
  CustomTextForm( var obScur, var validate , {var controller , bool isNarrow = false} ){
    this.obScur=obScur;
    this.validate=validate;
    this.controller = controller;
    this.isNarrow = isNarrow;
  }

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  var hint;
  
  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Stack(
                    children: [
                      Padding(
      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obScur,
          validator: (value){
            if (value.isEmpty)
              return '${widget.validate}';
          },
          cursorColor:Colors.green ,
          decoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize:15
            ),
           // contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            contentPadding: EdgeInsets.only(left: 15 , right:15),
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
    ) ,
                     widget.obScur? Positioned(
                          top: mediQuery.height * .025,
                          left: widget.isNarrow ? mediQuery.width * .7:mediQuery.width * .83,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.obScur = !widget.obScur;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black45,
                              ))):Container()
                    ],
                  );
  }
}
