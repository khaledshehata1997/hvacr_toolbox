

import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/video/video.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';

class Videos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: appbar(context, "Videos", true),
      body: Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            video( context , 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4' , "How to register on the site"),
            //  video( context , 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4' , "How to register on the site"),
            //   video( context , 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4' , "How to register on the site"),

          ],),
        )
      ),
    );
  }
  Widget video(BuildContext context,String url , String text){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12 , blurRadius: 2 , spreadRadius: 2)]
      ),
      margin: EdgeInsets.only(bottom:20),
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
        Container(
        height: 220,
        width: MediaQuery.of(context).size.width,
        child: VideoApp(url)),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left :20 , right:20),
          alignment: Alignment.centerLeft,
          child: Text(text , style:TextStyle(color: Colors.black54 , fontSize:18)),
        )
        ]
      ),
    );
  }
}