import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/MainScreen.dart';
import 'package:hvacr_tool_box/screens/auth_screens/Sign_in.dart';
import 'package:hvacr_tool_box/screens/auth_screens/forget_password.dart';
import 'package:hvacr_tool_box/screens/auth_screens/sign_up.dart';
import 'package:hvacr_tool_box/screens/compressor/Compressor.dart';
import 'package:hvacr_tool_box/screens/edit_my_profile.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/trouble_shooting.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screens/sharedPrefrencesFunc/authSaveAndGet.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SignData>(
      create: (context) => SignData(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "avenir",
          primaryColor: Color(0xff2c8b29),
          accentColor: Color(0xff2c8b29)),
      debugShowCheckedModeBanner: false,
      home: (FutureBuilder<bool>(
     future: checkSignIn(context),
     builder: (buildContext, snapshot) {
       if(snapshot.hasData) {
         if(snapshot.data){
           // Return your login here
        return SignIn();
      }

      // Return your home here
      return TroubleShooting();
    } else {

      // Return loading screen while reading preferences
      return Center(child: CircularProgressIndicator());
    }
  },
)),
      routes: {
        '/SignIn': (context) => SignIn(),
        '/SignUp': (context) => SignUp(),
        '/MainScreen': (context) => MainScreen(),
        '/Compressor': (context) => Compressor(),
        '/ForgetPassword': (context) => ForgetPassword(),
        '/EditMyProfile': (context) => EditMyProfile(),
        '/ForgetPassword': (context) => ForgetPassword(),
      },
      title: 'Hvacr Tool Box',
    );
  }
}
