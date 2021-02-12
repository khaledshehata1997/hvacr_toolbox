import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:hvacr_tool_box/screens/contact_us.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:hvacr_tool_box/widgets/textOnFields.dart';
import 'package:provider/provider.dart';

class EditMyProfile extends StatefulWidget {
  
  @override
  _EditMyProfileState createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {


    final _formKey1 = GlobalKey<FormState>();
    String message1 = "";
    bool isLoading1 = false;
    final TextEditingController _emailController = new TextEditingController();
    final TextEditingController _firstNameController = new TextEditingController();
    final TextEditingController _secondNameController = new TextEditingController();


    final _formKey2 = GlobalKey<FormState>();
    String message2 = "";
    bool isLoading2 = false;
    final TextEditingController _oldPasswordController = new TextEditingController();
    final TextEditingController _newPasswordController = new TextEditingController();
    final TextEditingController _confermPasswordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    var mediQuery=MediaQuery.of(context).size;

    return Scaffold(
      appBar: appbar(context, 'EDIT MY PROFILE', true),
      body: ListView(
        children: [
         Container(
           margin: EdgeInsets.all(15),
           padding: EdgeInsets.all(10),
           child: Column(
             children: [
               Container(
                 padding: EdgeInsets.all(10),
                 width: mediQuery.width * .9,
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
                 child: Form(
                   key: _formKey1,
                     child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       textOnFields(context,'First name',true),
                       CustomTextForm(false, 'enter first name' , controller: _firstNameController,),
                       SizedBox(
                         height: mediQuery.width * .05,
                       ),

                       textOnFields(context,'Last name',true),
                       CustomTextForm(false, 'enter last name ' , controller: _secondNameController,),
                       SizedBox(
                         height: mediQuery.width * .05,
                       ),

                       textOnFields(context,'Email',true),
                       CustomTextForm(false, 'enter email ' , controller: _emailController,),

                     ],
                   ),
                 ),
               ),
               isLoading1 == true
                      ?SizedBox(
                    height: mediQuery.height * .05,
                  ):Container(),

                  //states == true ? CircularProgressIndicator() : Container(),
                  isLoading1 == true
                      ? Center(
                          child: Container(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator()),
                        )
                      : Container(),
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Center(
                        child: Text(
                      "$message1",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                  )),
                   ),
                  
               DefaultButton(text: 'SAVE',
                 press: (){
                   String email, name;
                      if (_formKey1.currentState.validate()) {
                        _formKey1.currentState.save();

                        setState(() {
                          isLoading1 = true;
                        });

                        email = _emailController.text.toLowerCase();
                        name = _firstNameController.text +" "+ _secondNameController.text;
                        updateEmailAndName(email, name);
                      }
                 },
               ),
               SizedBox(height: mediQuery.height*.04,),
               Container(
                 padding: EdgeInsets.all(10),
                 width: mediQuery.width * .9,
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
                 child: Form(
                   key: _formKey2,
                     child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       textOnFields(context,'Old password',true),
                       CustomTextForm(true, 'old password', isNarrow: true,controller: _oldPasswordController,),
                       SizedBox(
                         height: mediQuery.width * .05,
                       ),
                       textOnFields(context,'New password',true),
                       CustomTextForm(true, 'new password', isNarrow: true,controller: _newPasswordController,),
                       SizedBox(
                         height: mediQuery.width * .05,
                       ),
                       textOnFields(context,'Confirm new password',true),
                       CustomTextForm(true, 'confirm password' , isNarrow: true,controller: _confermPasswordController,),

                     ],
                   ),
                 ),
               ),
               isLoading2?SizedBox(
                    height: mediQuery.height * .05,
                  ):Container(),

                  //states == true ? CircularProgressIndicator() : Container(),
                  isLoading2 == true
                      ? Center(
                          child: Container(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator()),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Text(
                      "$message2",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )),
                  ),
               
               DefaultButton(text: 'SAVE',
                 press: (){
                   String oldpass, newpass , confpass;
                      if (_formKey2.currentState.validate()) {
                        _formKey2.currentState.save();

                        setState(() {
                          isLoading2 = true;
                        });

                        oldpass = _oldPasswordController.text;
                        newpass = _newPasswordController.text;
                        confpass = _confermPasswordController.text;
                        updatepassword(oldpass, newpass , confpass);
                      }
                 }
               )
             ],
           ),
         )
        ],
      ),
    );
  }

  updateEmailAndName(String email, String name) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/user/update-profile";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
        body:
            jsonEncode(<String, String>{"name": "$name","email": "$email"}),
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        alertTost("${data['message']}");
        Navigator.pop(context);
      } else {
        setState(() {
          isLoading1 = false;
          message1 = data['message'];
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading1 = false;
        message1 = "Error From Server or Network";
      });
    }
  }

  updatepassword(String oldpass, String newpass , String confpass) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    try {
      var url = "https://api.hvacrtoolbox.com/api/user/update-password";

      var request = await http.post(
        url,
         headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${signData.getToken}'
        },
        body:
            jsonEncode(<String, String>{'current_password': oldpass, 'new_password': newpass, 'new_password_confirmation': confpass}),
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        alertTost("${data['message']}");
        Navigator.pop(context);
      } else {
        setState(() {
          isLoading2 = false;
          message2 = data['message'];
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading2 = false;
        message2 = "Error From Server or Network";
      });
    }
  }
}
