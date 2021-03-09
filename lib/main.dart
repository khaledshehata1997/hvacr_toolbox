import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/MainScreen.dart';
import 'package:hvacr_tool_box/screens/auth_screens/Sign_in.dart';
import 'package:hvacr_tool_box/screens/auth_screens/forget_password.dart';
import 'package:hvacr_tool_box/screens/auth_screens/sign_up.dart';
import 'package:hvacr_tool_box/screens/compressor/Compressor.dart';
import 'package:hvacr_tool_box/screens/edit_my_profile.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/air_conditioners/chillers.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/air_conditioners/package_are_conditioner.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/air_conditioners/residential_air_conditioners.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/air_conditioners/vdv.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/refregrator/refrigrator_result.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/trouble_shooting.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screens/sharedPrefrencesFunc/authSaveAndGet.dart';
import 'screens/trouble_shotting/air_conditioners/vrf.dart';

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
          colorScheme: ColorScheme.light(
                    primary: Color(0xff2c8b29)
                  ),
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
      return MainScreen();
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
        'ResidentialAirCondition': (context) => ResidentialAirCondition(),
        'TroubleShooting': (context) => TroubleShooting(),
        'PackageAirCondition': (context) => PackageAirCondition(),
        'Vdv': (context) => Vdv(),
        'Vrf': (context) => Vrf(),
        'Chillers': (context) => Chillers(),
        'RefrigeratorResult': (context) => RefrigeratorResult(),
      },
      title: 'Hvacr Tool Box',
    );
  }
}
