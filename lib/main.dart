import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
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
       home: Settings() ,
      title: 'Hvacr Tool Box',

    ),
  ));
}



