
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context , 'CONTACT US' , true),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: mediQuery.width * .9,
                  height: mediQuery.height * .42,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Keep in touch with us",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Safa Mall 4, Office 115,\n10TH of Ramadan City, Egypt",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_android_sharp,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Mobile",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "+201143422450",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black45,
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "info@hvacr_toolbox.com",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Mail us your message",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: mediQuery.width * .06,
                ),

                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    " name",
                    style: TextStyle(
                        fontSize: mediQuery.width * .045,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                CustomTextForm(false, 'ادخل الاسم ' ),
                SizedBox(
                  height: mediQuery.width * .02,
                ),

                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text(
                                    
                    " Email",
                    style: TextStyle(
                        fontSize: mediQuery.width * .045,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                CustomTextForm(false, 'ادخل البريد الالكتروني '),
                SizedBox(
                  height: mediQuery.width * .02,
                ),

                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Text(
                    "Subject",
                    style: TextStyle(
                        fontSize: mediQuery.width * .045,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                CustomTextForm(false, 'ادخل الاسم '),
                SizedBox(
                  height: mediQuery.width * .02,
                ),

                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    " Description",
                    style: TextStyle(
                        fontSize: mediQuery.width * .045,
                        color: Colors.green,
                        fontWeight: FontWeight.w500),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: TextFormField(
                    maxLines: 7,
                      obscureText: false,
                      onSaved: (value) {},
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: .01, horizontal: 5.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.values[1],
                                color: Colors.black45)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.values[1],
                                color: Colors.black45)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black45)),
                      )),
                ),
                SizedBox(
                  height: mediQuery.width * .06,
                ),

                DefaultButton(
                  text: 'Send',
                  press: (){

                  },)
              ],
            ),
          )
        ],
      ),
    );
  }
}
