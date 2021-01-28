import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/MainScreen.dart';
import 'package:hvacr_tool_box/screens/auth_screens/sign_up.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sharedPrefrencesFunc/authSaveAndGet.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  // var keepMeLoggedIn=false;

  String message = "";
  bool isLoading = false;

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, 'LOG IN', false),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Icon(Icons.arrow_back_ios,
                  //         color: Colors.black45, size: 27),
                  //     SizedBox(
                  //       width: mediQuery.width * .26,
                  //     ),
                  //     Container(
                  //       child: Text(
                  //         'LOG IN',
                  //         style: TextStyle(
                  //             fontSize: 27,
                  //             color: Colors.black45,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: mediQuery.width * .04,
                  ),
                  Text(
                    'Welcome back please insert your username and password to log in',
                    style: TextStyle(
                      fontSize: mediQuery.width * .047,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: mediQuery.width * .1,
                  ),
                  Text(
                    "Username",
                    style: TextStyle(
                        fontSize: mediQuery.width * .05,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                  CustomTextForm(
                    false,
                    'Please Enter The Email',
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: mediQuery.width * .045,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        fontSize: mediQuery.width * .05,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                  CustomTextForm(
                    true,
                    'Please Enter the password',
                    controller: _passwordController,
                  ),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       checkColor: Colors.white,
                  //       activeColor: Colors.green,
                  //       value: keepMeLoggedIn,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           keepMeLoggedIn = value;
                  //         });
                  //       },
                  //     ),
                  //     Text(
                  //       'Remember me',
                  //       style: TextStyle(color: Colors.black45),
                  //     )
                  //   ],
                  // ),
                  Container(
                    margin: EdgeInsets.only(right: 13, top: 5),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Text(
                        "Forget Password!",
                        style: TextStyle(
                            fontSize: mediQuery.width * .05,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediQuery.height * .05,
                  ),

                  //states == true ? CircularProgressIndicator() : Container(),
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
                  SizedBox(
                    height: 20,
                  ),

                  DefaultButton(
                    text: 'LOG IN',
                    press: () {
                      String email, password;
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        setState(() {
                          isLoading = true;
                        });

                        email = _emailController.text.toLowerCase();
                        password = _passwordController.text;
                        loginData(email, password);
                      }
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(
                "Or use social media accounts ",
                style: TextStyle(
                    fontSize: mediQuery.width * .05,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'images/Topic-Facebook.jpg',
                    fit: BoxFit.fill,
                  ),
                  margin: EdgeInsets.all(15),
                  width: mediQuery.width * .33,
                  height: mediQuery.height * .063,
                ),
                Container(
                  child: Image.asset(
                    'images/google.jpg',
                    fit: BoxFit.fill,
                  ),
                  margin: EdgeInsets.all(15),
                  width: mediQuery.width * .33,
                  height: mediQuery.height * .063,
                ),
              ],
            ),
            SizedBox(
              height: mediQuery.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'if you don’t have an account please ',
                  style: TextStyle(
                    fontSize: mediQuery.width * .042,
                    color: Colors.black45,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    'SIGN UP ',
                    style: TextStyle(
                        fontSize: mediQuery.width * .05,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  loginData(String email, String password) async {
    try {
      print(email);
      print(password);
      var url = "https://api.hvacrtoolbox.com/api/auth/login";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        saveTok("${data['token']}");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (Route<dynamic> route) => false,
        );
      } else {
        setState(() {
          isLoading = false;
          message = data['message'];
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
