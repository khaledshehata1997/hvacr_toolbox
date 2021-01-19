


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
      appBar: appbar(context, " ", false , isdrawer: true , scaffoldKey:_scaffoldKey ),
      drawer: drawer(context),
      body: Container(
        margin: EdgeInsets.only(top:20),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: [
          mainCards( "images/compressor.png" , "Compressors"),
          mainCards( "images/evaluation.png" , "Applications"),
          mainCards( "images/questionary.png" , "Troubleshooting"),
          mainCards( "images/book_5.png" , "Library")

        ],
        )
      ),
    );
  }
  Widget mainCards(image , text){
    return Container(
      margin: EdgeInsets.all(5),
      height: 100,
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12 , blurRadius: 2 , spreadRadius: 0)]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            child: Image(image: AssetImage(image))),
          SizedBox(height:25),
          Text(text , style:TextStyle(color: Colors.black54 , fontSize:20 , fontWeight: FontWeight.w600) )
        ],
      ),
    );
  }
}