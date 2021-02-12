import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/MainScreen.dart';
import 'package:hvacr_tool_box/screens/auth_screens/Sign_in.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        useLoader: true,
        seconds: 3,
        navigateAfterSeconds: new SignIn(),

        image: new Image.asset('logos/logo_h.png'),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 130.0,
        loaderColor: Colors.green);
  }
}

