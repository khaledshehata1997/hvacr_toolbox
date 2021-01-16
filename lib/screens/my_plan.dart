import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';

class MyPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediQuery=MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, 'MY PLAN', true),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12,right: 12,top: 12),
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
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
                  "Free plan",
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
                      "2 Months",
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
                      "3",
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
                      "0",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: mediQuery.width *.9,
                  height: 50,
                  color: Colors.black26,
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(
                        "Free ",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                        Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 23,)
                    ],),
                  ),

                )
              ],
            ),
          ),
          SizedBox(height: mediQuery.height*.02,),
          Container(
            margin: EdgeInsets.only(left: 12,right: 12,top: 12),
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
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
                  "3 Months plan",
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
                      "3 Months",
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
                      "5",
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
                      "5",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: mediQuery.width *.9,
                  height: 50,
                  color: Colors.orange[800],
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ 15.00 ",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 23,)
                      ],),
                  ),

                )
              ],
            ),
          ),
          SizedBox(height: mediQuery.height*.02,),
          Container(
            margin: EdgeInsets.only(left: 12,right: 12,top: 12),
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
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
                  "6 Months plan",
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
                      "6 Months",
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
                      "8",
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
                      "8",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: mediQuery.width *.9,
                  height: 50,
                  color: Colors.yellowAccent[700],
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ 20.00 ",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 23,)
                      ],),
                  ),

                )
              ],
            ),
          ),
          SizedBox(height: mediQuery.height*.02,),
          Container(
            margin: EdgeInsets.only(left: 12,right: 12,top: 12),
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
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
                  "6 Months plan",
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
                      "12 Months",
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
                      "10",
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
                      "10",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: mediQuery.width *.9,
                  height: 50,
                  color: Colors.green,
                  child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ 30.00 ",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 23,)
                      ],),
                  ),

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
