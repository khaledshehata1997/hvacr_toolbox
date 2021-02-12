

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/video/video.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:provider/provider.dart';

class Videos extends StatefulWidget{
  
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  List<String> names = [];
  List<String> descriptions = [];
  List<String> ids = [];

  @override
  void initState() {
    getVideos(context);
    super.initState();
  }
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
        child:ListView.builder(
          shrinkWrap: true,
          itemCount: names.length,
        itemBuilder:(context , i){
          return video(context, ids[i], names[i], descriptions[i]);
        }
          
        )
      ),
    );
  }

  Widget video(BuildContext context,String url , String text , String description){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12 , blurRadius: 2 , spreadRadius: 2)]
      ),
      margin: EdgeInsets.only(bottom:20),
      //height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
        Container(
        //height: 270,
        width: MediaQuery.of(context).size.width,
        child: VideoApp(url)),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(text , style:TextStyle(color: Colors.black54 , fontSize:18)),
              Text(description , style:TextStyle(color: Colors.black54 , fontSize:15)),
            ],
          ),
        )
        ]
      ),
    );
  }

  getVideos(context) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/tutorials";

      var request = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
      );
      print(request.body);
      var data = jsonDecode(request.body);
      List dataa = data["tutorials"];

      
      if ("${data['success']}" == "true") {
        for (var i = 0; i < dataa.length; i++) {
            names.add("${dataa[i]["title"]["en"]}");
            descriptions.add("${dataa[i]["description"]["en"]}");
            String url = "${dataa[i]["url"]}";
           List<String> id = url.split("/"); 
           print(id[id.length-1]);
           ids.add(id[id.length-1]);
      }
      setState(() {
        
      });
      } else {
        alertTost("${data["message"]}");
        
      }
    } catch (e) {
      alertTost("Error From Server or Network");
    }
  }
}