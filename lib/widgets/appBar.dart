import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget appbar(context,String text1 , bool isGreen ,{ bool isdrawer = false , scaffoldKey} ){
 return AppBar(
        title: Text(text1 , style:TextStyle(color: isGreen ? Colors.white : Colors.black45)),
        backgroundColor: isGreen? Theme.of(context).primaryColor : Color(0xffffffff),
        centerTitle: true,
        elevation: 0,
        actions: [
        isdrawer? IconButton(color: isGreen ? Colors.white : Colors.black45 , icon: Icon(Icons.menu), onPressed: (){
        // drawerKey.currentState.openDrawer();
        scaffoldKey.currentState.openDrawer();
        },):Container()
        ],
        leading:text1 == 'LOG IN' || text1 == " "? Container(): 
        IconButton(color: isGreen ? Colors.white : Colors.black45 , icon: Icon(Icons.arrow_back_ios), onPressed: (){
         Navigator.pop(context);
        },),
      );
}