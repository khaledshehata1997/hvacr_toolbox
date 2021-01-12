import 'package:flutter/material.dart';
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
        loadingText:Text('By : Khaled M Shehata'),
        seconds: 2,
        //navigateAfterSeconds: new Login(),
        title: new Text(
          'Welcome to Blood Bank',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),

        image: new Image.asset('logos\logo_h.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}

