import 'package:flutter/material.dart';

Widget serchBar(Function onChanged(value), text) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: TextField(
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                width: 3, style: BorderStyle.values[1], color: Colors.black45)),
        prefixIcon: Icon(Icons.search),
        hintText: text,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      ),
    ),
  );
}
