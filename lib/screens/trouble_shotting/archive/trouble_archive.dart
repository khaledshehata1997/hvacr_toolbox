import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/trouble_shotting/air_conditioners/residential_air_conditioners.dart';

class Archive extends StatefulWidget {
  @override
  _ArchiveState createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          diagnostic(),
          diagnostic(),
          diagnostic(),
          diagnostic(),
          diagnostic(),
          diagnostic(),
        ],
      ),
    );
  }
  Widget diagnostic(){
    return Container(
      margin: EdgeInsets.all(15),
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
      padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Folder',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
          DropdownButton(
            icon: Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black45),
            onChanged: (value) {

            },
            items: <String>['Sub Folder', 'Sub Folder', 'Sub Folder', 'Sub Folder']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Column(
                  children: [
                    RaisedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value,style: TextStyle(fontSize: 18),),
                          Icon(Icons.arrow_forward_outlined,size: 30,)
                        ],
                      ),
                      onPressed: (){},
                      color: Colors.white,
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
