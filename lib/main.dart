import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/aboutUs.dart';
import 'package:hvacr_tool_box/screens/myProfile.dart';
import 'package:hvacr_tool_box/screens/privacyPolicy.dart';
import 'package:hvacr_tool_box/screens/terms.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screens/forget_password.dart';
import 'screens/contact_us.dart';


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
       home: MyProfile() ,
      title: 'Hvacr Tool Box',

    ),
  ));
}



