import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/serchBar.dart';

class Commerical extends StatefulWidget {
  @override
  _CommericalState createState() => _CommericalState();
}
class _CommericalState extends State<Commerical> {
  @override
  Widget build(BuildContext context) {
   return serchBar((value){}, 'search here');
  }
}
