import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/auth_screens/Sign_in.dart';
import 'package:hvacr_tool_box/toast/alerts.dart';

import '../../widgets/appBar.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/default_button.dart';
import '../../widgets/textOnFields.dart';

class ChangeForgotPassword extends StatefulWidget {
  final email;
  ChangeForgotPassword(this.email);
  @override
  _ChangeForgotPasswordState createState() => _ChangeForgotPasswordState();
}

class _ChangeForgotPasswordState extends State<ChangeForgotPassword> {
  String message = "";

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pinController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordReController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, 'CHANGE YOUR PASSWORD', false),
      body: ListView(
        children: [
          SizedBox(
            height: mediQuery.height * .08,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'please notice that the password that you will enter you gonna use it to login to your profile in future ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: mediQuery.height * .05,
                  ),
                  textOnFields(context, 'Pin Code', false),
                  CustomTextForm(
                    false,
                    'ادخل الكود الذي تم ارساله لك',
                    controller: _pinController,
                  ),
                  SizedBox(height: 20),
                  textOnFields(context, 'New Password', false),
                  CustomTextForm(
                    true,
                    'ادخل الرقم السري',
                    controller: _passwordController,
                  ),
                  SizedBox(height: 20),
                  textOnFields(context, 'Confirm Password', false),
                  CustomTextForm(
                    true,
                    'ادخل الرقم السري',
                    controller: _passwordReController,
                  ),
                  SizedBox(height: 25),
                  isLoading == true
                      ? Center(
                          child: Container(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator()),
                        )
                      : Container(),
                  Center(
                      child: Text(
                    "$message",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  )),
                  isLoading
                      ? SizedBox(
                          height: 20,
                        )
                      : Container(),
                  DefaultButton(
                    text: 'CONFIRM PASSWORD',
                    press: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        String email, pin, password, passwordRe;
                        setState(() {
                          isLoading = true;
                        });

                        email = widget.email;
                        pin = _pinController.text;
                        password = _passwordController.text;
                        passwordRe = _passwordReController.text;
                        resetPassowrdSecondOperation(
                            email, pin, password, passwordRe);
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  resetPassowrdSecondOperation(
      String email, String pin, String password, String passwordRe) async {
        print(password);
        print(passwordRe);
    try {
      var url = "https://api.hvacrtoolbox.com/api/password/reset";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": email,
          "pin": pin,
          "new_password": password,
          "new_password_confirmation": passwordRe
        }),
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        alertTost("${data['message']}");
       Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
          (Route<dynamic> route) => false,
        );
          
        
      } else {
        setState(() {
          isLoading = false;
          message = "${data['errors']}";
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
        message = "Error From Server or Network";
      });
    }
  }
}
