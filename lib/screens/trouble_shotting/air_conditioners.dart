import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TroubleAirConditioners extends StatefulWidget {
  @override
  _TroubleAirConditionersState createState() => _TroubleAirConditionersState();
}

class _TroubleAirConditionersState extends State<TroubleAirConditioners> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        troubleAir('Residential Air Conditioners',(){}),
        troubleAir('Package Air Conditioners',(){}),
        troubleAir('VDV',(){}),
        troubleAir('VRF',(){}),
        troubleAir('Chillers',(){}),
      ],
    );
  }
  Widget troubleAir(String title ,void press()){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Container(
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
          borderRadius: BorderRadius.circular(10),
        ),
        height: 55,
        child: RaisedButton(
          color: Colors.white,
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$title',style: TextStyle(
                  fontSize: 19,color: Colors.green,fontWeight: FontWeight.bold),),
              Icon(Icons.arrow_forward_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
