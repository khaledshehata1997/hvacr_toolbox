import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/contact_us.dart';
import 'package:provider/provider.dart';

import 'screens/auth_screens/change_password.dart';
import 'screens/auth_screens/forget_password.dart';
import 'screens/errors/errorNoInternet.dart';
import 'screens/errors/errorServerDown.dart';

void main() {
  runApp( MultiProvider(
    providers:[
      ChangeNotifierProvider<SignData>(
        create: (context)=>SignData(),

      ),
    ],
    child: MaterialApp(
      theme: ThemeData(
      primaryColor: Color(0xff2c8b29),
      accentColor: Color(0xffffffff)
    ),
      debugShowCheckedModeBanner: false,
       home: ForgetPassword() ,
      title: 'Hvacr Tool Box',

    ),
  ));
}



