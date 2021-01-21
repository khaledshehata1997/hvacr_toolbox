


import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/CategoryBar.dart';
import 'package:hvacr_tool_box/widgets/Drawer.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String textlol = "3";
  List<String> test = ["helllo" , "man" , "world"] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffffffff),
      bottomSheet: Container(
        height:70,
        width:MediaQuery.of(context).size.width,
        child: Image(image: AssetImage("images/group_2.png")),
      ),
      appBar: appbar(context, " ", false , isdrawer: true , scaffoldKey:_scaffoldKey ) ,
      drawer: drawer(context,),
      body: ListView(
        children: [
          mainCards( "images/home_images/compr.png" , "Compressors"),
          mainCards( "images/home_images/app.png" , "Applications"),
          mainCards( "images/home_images/torub.png" , "Troubleshooting"),
          mainCards( "images/home_images/lib.png" , "Library"),
        ],
      ),
    );
  }
  Widget mainCards(image , text){
    return Container(

      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width*.85,
      height: MediaQuery.of(context).size.height*.18,
       decoration: BoxDecoration(
         image:  DecorationImage(
           image: AssetImage(image),
           fit: BoxFit.cover,
         ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
              color: Colors.grey
            , blurRadius: 20,
          )]
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text , style:TextStyle(color: Colors.black54 , fontSize:20 , fontWeight: FontWeight.w600) ),
                Icon(Icons.arrow_forward)
              ],
            ),
          )

        ],
      ),
    );
  }
}