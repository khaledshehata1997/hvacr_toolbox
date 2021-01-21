
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/MainScreen.dart';
import 'package:hvacr_tool_box/screens/applications/application.dart';
import 'package:hvacr_tool_box/screens/auth_screens/Sign_in.dart';
import 'package:hvacr_tool_box/screens/auth_screens/forget_password.dart';
import 'package:hvacr_tool_box/screens/auth_screens/sign_up.dart';
import 'package:hvacr_tool_box/screens/compressor/Compressor.dart';
import 'package:hvacr_tool_box/screens/edit_my_profile.dart';
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
      routes: {
        '/SignIn':(context)=>SignIn(),
        '/SignUp':(context)=>SignUp(),
        '/MainScreen':(context)=>MainScreen(),
        '/Compressor':(context)=>Compressor(),
        '/ForgetPassword':(context)=>ForgetPassword(),
        '/EditMyProfile':(context)=>EditMyProfile(),
        '/ForgetPassword':(context)=>ForgetPassword(),
      },
      title: 'Hvacr Tool Box',

    ),
  ));
}



