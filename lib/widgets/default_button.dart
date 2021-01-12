import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  DefaultButton({
    this.text,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery =MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: mediaQuery.height*0.06,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.green,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}