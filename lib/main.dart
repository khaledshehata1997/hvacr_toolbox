import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/aboutUs.dart';
import 'package:hvacr_tool_box/screens/auth_screens/Sign_in.dart';
import 'package:hvacr_tool_box/screens/auth_screens/change_password.dart';
import 'package:hvacr_tool_box/screens/auth_screens/sign_up.dart';
import 'package:hvacr_tool_box/screens/auth_screens/splash.dart';
import 'package:hvacr_tool_box/screens/errors/errorNoInternet.dart';
import 'package:hvacr_tool_box/screens/errors/errorNoResult.dart';
import 'package:hvacr_tool_box/screens/errors/errorServerDown.dart';
import 'package:hvacr_tool_box/screens/myProfile.dart';
import 'package:hvacr_tool_box/screens/privacyPolicy.dart';
import 'package:hvacr_tool_box/screens/terms.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'screens/auth_screens/forget_password.dart';
import 'screens/contact_us.dart';
import 'screens/edit_my_profile.dart';
import 'screens/my_plan.dart';
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



