import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/compressor/Compressor.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/trouble_shooting.dart';
import 'package:hvacr_tool_box/widgets/CategoryBar.dart';
import 'package:hvacr_tool_box/widgets/Drawer.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';

import 'applications/application.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  //String textlol = "3";
  //List<String> test = ["helllo" , "man" , "world"] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffffffff),
      bottomSheet: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Image(image: AssetImage("images/group_2.png")),
      ),
      appBar: appbar(context, " ", false,
          isdrawer: true, scaffoldKey: _scaffoldKey),
      drawer: drawer(
        context,
      ),
      body: ListView(
        children: [
          mainCards("images/home_images/compr.png", "Compressors" , 1),
          mainCards("images/home_images/app.png", "Applications" , 2),
          mainCards("images/home_images/torub.png", "Troubleshooting" , 3),
          mainCards("images/home_images/lib.png", "Library" , 4),
          SizedBox(height:70),
        ],
      ),
    );
  }

  Widget mainCards(image, text , id) {
    return GestureDetector(
      onTap: (){
           switch(id){
             case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=>Compressor())); break;
             case 2 :Navigator.push(context, MaterialPageRoute(builder: (context)=>Application())); break;
             case 3 :Navigator.push(context, MaterialPageRoute(builder: (context)=>TroubleShooting())); break;
             default:print("clicked");
           } 
          },
          child: Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width * .85,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 1)
                ],
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.65,
                child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.black
                  ]
                  )
                 ),),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
