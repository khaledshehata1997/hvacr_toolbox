import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/errors/errorNoInternet.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:provider/provider.dart';

class MyPlan extends StatefulWidget {
  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  
  @override
  initState(){
    getPlans();
    super.initState();
  }
  bool hasData = false;
  List<String> name = [];
  List<String> price = [];
  List<String> period = [];
  List<String> frequency = [];
  List<String> search = [];
  List<String> files = [];
  var color = [
    Colors.black26,
    Colors.orange,
    Colors.blue[400],
    Colors.purple[900],
    Colors.green[900]
  ];
  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return  hasData? Scaffold(
                appBar: appbar(context, 'MY PLAN', true),
                body: ListView.builder(
                    itemCount: name.length,
                    itemBuilder: (context, i) {
                      return plans(mediQuery, name[i], price[i], period[i],
                          frequency[i], search[i], files[i], color[i]);
                    })): ErrorNoInternet(
            press: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyPlan()));
            },
          );
  }


  Widget plans(mediQuery, String name, String price, String period,
      String frequency, String search, String files, color) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 18),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      width: mediQuery.width * .9,
      height: mediQuery.height * .33,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$name plan",
            style: TextStyle(
                fontSize: 22,
                color: Colors.black45,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Guarantee for",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "$period $frequency",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available search Times ",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "$search",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Viewing files",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "$files",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            width: mediQuery.width * .9,
            height: 50,
            color: color,
            child: FlatButton(
              onPressed: () {
            if(price == "0.00"){
              subScriptionToFreePlan();
             }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$price",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 23,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> getPlans() async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/plans";

      var request = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
      );
      print(request.body);
      var data = jsonDecode(request.body);
      List dataPlans = data["plans"];

      if ("${data['success']}" == "true") {
        for (var i = 0; i < dataPlans.length; i++) {
          name.add("${dataPlans[i]["name"]["en"]}");
          price.add("${dataPlans[i]["price"]}");
          period.add("${dataPlans[i]["period"]}");
          frequency.add("${dataPlans[i]["frequency"]}");
          search.add("${dataPlans[i]["limits"]["search"]}");
          files.add("${dataPlans[i]["limits"]["files"]}");
        }
        setState(() {
          hasData = true;
        });
        
        return true;
      } else {
        alertTost("${data["errors"]}");
        return false;
      }
    } catch (e) {
      alertTost("Error From Server or Network");
      return false;
    }
  }

   subScriptionToFreePlan() async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/payments/subscribe-free";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        alertTost("${data["message"]}");
        
      } else {
        alertTost("${data["message"]}");
        
      }
    } catch (e) {
      alertTost("Error From Server or Network");
    }
  }
}
