import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:hvacr_tool_box/screens/Sign_in.dart';

void main() {
  runApp( MultiProvider(
    providers:[
      ChangeNotifierProvider<SignData>(
        create: (context)=>SignData(),

      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
       home: SignIn() ,
      title: 'Hvacr Tool Box',

    ),
  ));
}



