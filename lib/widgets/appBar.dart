import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget appbar(context,String text1 , bool isGreen ){
 return AppBar(
        title: Text(text1 , style:TextStyle(color: isGreen ? Colors.white : Colors.black45)),
        backgroundColor: isGreen? Theme.of(context).primaryColor : Theme.of(context).accentColor,
        centerTitle: true,
        elevation: 0,
        leading:text1 == 'LOG IN'? Container(): IconButton(color: isGreen ? Colors.white : Colors.black45 , icon: Icon(Icons.arrow_back_ios), onPressed: (){
         Navigator.pop(context);
        },),
      );
}