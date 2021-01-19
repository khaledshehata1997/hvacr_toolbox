
import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  final List<String> text;
  final Function press;
  final List<Widget> listWidget;
  CategoryBar(
    this.text,
    this.press,
    this.listWidget
  ):assert(listWidget.length == text.length);

  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int thisIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
    width: MediaQuery.of(context).size.width,
    child: SingleChildScrollView(
          child: Column(
          children: [
      Container(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.text.length,
            itemBuilder: (context , i){
              return categoryBarElement(widget.text[i] , thisIndex == i ? true : false , i);
            },
        ),
      ),
      SizedBox(height:20),
      widget.listWidget[thisIndex]
          ],
        ),
    )
  );
  }

  Widget categoryBarElement(text , bool selected , int ind) {
  return GestureDetector(
      onTap: (){
        setState(() {
           thisIndex = ind;
        });
        widget.press();
      },
      child: Container(
      color: selected ? Color(0xff2c8b29) : Color(0xffe1e1e1),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: selected ? Colors.white : Color(0xff767676)),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 25, left: 25),
      height: 44,
    ),
  );
}
}

