
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/textOnFields.dart';

Widget complexTabelWidget(context, String tableTitle , List<String> coulm1,
    List<List<String>> coulm2, List<List<String>> coulm3) {
  return Column(
    children: [
      //  serchBar((value){},''),
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 10),
          child: textOnFields(context, tableTitle, true)),
      Container(
          //  padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width * .9,
          color: Colors.black12,
          child:  Column(
            children: [
              for(int ind = 0 ; ind<coulm1.length ; ind++)...[ Row(
                    children: [
                      colum1(context , coulm2[ind].length , coulm1[ind]),
                      Column(
                        children:[
                      for(int i = 0 ; i<coulm2[ind].length ; i++)...[
                        Container(
                          width: MediaQuery.of(context).size.width*0.59,
                          child: Row(
                            children: [
                      Container(
                          width: 1.5,
                          height: 50,
                          color: Colors.white,
                      ),
                      colum3(ind , i , coulm3[ind].length , coulm1.length , coulm3[ind][i])
                            ]
                          ),
                        )
                        
                      ]
                      ]
                      )
                    ],
                  ),]
            ],
          )
           )
    ],
  );
}

Widget colum1(context , int count , String text) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 12),
        height: (count * 50.0) + count,
        width: MediaQuery.of(context).size.width * 0.31,
        color: Theme.of(context).primaryColor,
        child: Text('$text',
            style: TextStyle(fontSize: 15, color: Colors.white)),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.31,
        height: 1.5,
        color: Colors.white,
      ),
    ],
  );
}

Widget colum3(int ind , int i , int iSize , int indSize , text) {
  bool isWhite;
  int size = iSize+ind+i;
  if(size%2 == 0){
     isWhite = true; 
  }
  else{
     isWhite = false; 
  }
  
  return Expanded(
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          height: 50,
          // width: MediaQuery.of(context).size.width*0.3,
          color: isWhite ? Color(0xffffffff) : Color(0xffc6c6c6),
          child: Text('$text',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff767676),
                  fontWeight: FontWeight.w600)),
        ),
        Container(
          height: 1.5,
          color: Colors.white,
        ),
      ],
    ),
  );
}

Widget sambleTabelWidget(
    context, String tableTitle , List<String> coulm1, List<String> coulm3) {
  return Column(
    children: [
      //  serchBar((value){},''),
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 10),
          child: textOnFields(context, "$tableTitle", true)),
      Container(
          //  padding: EdgeInsets.all(15),
          // height: MediaQuery.of(context).size.height*0.6,
          width: MediaQuery.of(context).size.width * .9,
          color: Colors.black12,
          child:  Column(
            
            children: [
              for(int index = 0 ; index<coulm3.length ; index++)...[ Column(
                    children:[
                       Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 12),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.35,
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
