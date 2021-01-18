import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/MainScreen.dart';
import 'package:hvacr_tool_box/screens/videos.dart';
import 'package:provider/provider.dart';
import 'screens/settings.dart';


void main() {
  runApp( MultiProvider(
    providers:[
      ChangeNotifierProvider<SignData>(
        create: (context)=>SignData(),

      ),
    ],
    child: MaterialApp(
      theme: ThemeData(
        fontFamily: "avenir",
      primaryColor: Color(0xff2c8b29),
      accentColor: Color(0xffffffff)
    ),
      debugShowCheckedModeBanner: false,
       home: MainScreen() ,
      title: 'Hvacr Tool Box',

    ),
  ));
}



