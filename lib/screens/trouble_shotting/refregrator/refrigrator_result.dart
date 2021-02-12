import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';
import 'package:hvacr_tool_box/widgets/table.dart';

class RefrigeratorResult extends StatefulWidget {
  RefrigeratorResult() : super();

  @override
  RefrigeratorResultState createState() => RefrigeratorResultState();
}

class RefrigeratorResultState extends State<RefrigeratorResult> {
  final List<String> col1 = ["Brand" , "Model" , "Code" , "Description EN" , "Description Ar" ];
  final List<String> col3 = ["Samsung","RSH1DTMHH","6E"," Ambient sensor open short","  يوجد شورت في حساس درجة حرارة الجو"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, 'TROUBLESHOOTING', true),
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You Choosed Error',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Samsung',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '6E',
                    style: TextStyle(fontSize: 19, color: Colors.black45),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*.4,
                        child: RaisedButton(

                        onPressed: () {},
                        child: Text(
                          'CHANGE ERROR',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black45,
                      ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*.39,
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {},
                          child: Text('RESET',style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              height: MediaQuery.of(context).size.height * .3,
              // height: MediaQuery.of(context).size.height,
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
            ),
          ),
          Container(
              margin: EdgeInsets.all(20),
              child:sambleTabelWidget(context,col1,col3) ,

          )]))
    );
  }
  Widget sambleTabelWidget(
      context , List<String> coulm1, List<String> coulm3) {
    return Column(
      children: [
        //  serchBar((value){},''),
        Container(
          //  padding: EdgeInsets.all(15),
          // height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width * .9,
            color: Colors.black12,
            child:  Column(

              children: [
                for(int index = 0 ; index<coulm1.length ; index++)...[ Column(
                  children:[
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 12),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.31,
                          color: Theme.of(context).primaryColor,
                          child: Text('${coulm1[index]}',
                              style: TextStyle(fontSize: 15, color: Colors.white)),
                        ),

                        Container(
                          width: 1.5,
                          height: 50,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: index%2==1? Color(0xffc6c6c6) : Colors.white,
                            child: Text('${coulm3[index]}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff767676),
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ],



                ),]
              ],
            ))
      ],
    );
  }
}
