import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';

import '../MainScreen.dart';
import 'Sign_in.dart';
import 'sharedPrefrencesFunc/authSaveAndGet.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var keepMeLoggedIn = false;
  var checkPrivcyPolicy = false;

  final _formKey = GlobalKey<FormState>();
  // var keepMeLoggedIn=false;

  String message = "";
  bool isLoading = false;

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordConfirmController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, 'SIGN UP', false),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 7),
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
                  //         'SIGN UP',
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
                    'Welcome to HVACR tool box please fill this form to sign up',
                    style: TextStyle(
                      fontSize: mediQuery.width * .045,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: mediQuery.width * .06,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text(
                      "name",
                      style: TextStyle(
                          fontSize: mediQuery.width * .045,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  CustomTextForm(false, 'ادخل الاسم ',controller: _nameController,),
                  SizedBox(
                    height: mediQuery.width * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontSize: mediQuery.width * .045,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  CustomTextForm(false, 'ادخل الايميل', controller: _emailController,),
                  SizedBox(
                    height: mediQuery.width * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontSize: mediQuery.width * .045,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  CustomTextForm(true, 'ادخل الرقم السري',controller: _passwordController,),
                  SizedBox(
                    height: mediQuery.width * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text(
                      "Confirm password",
                      style: TextStyle(
                          fontSize: mediQuery.width * .045,
                          color: Colors.black45,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  CustomTextForm(true, 'ادخل الرقم السري',controller: _passwordConfirmController,),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: keepMeLoggedIn,
                        onChanged: (value) {
                          setState(() {
                            keepMeLoggedIn = value;
                          });
                        },
                      ),
                      Text(
                        'Subscribe to newsletter',
                        style: TextStyle(color: Colors.black45),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: checkPrivcyPolicy,
                        onChanged: (value) {
                          setState(() {
                            checkPrivcyPolicy = value;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          text:
                              'I have read and consent to the HVACR\n TOOLBOX',
                          style: TextStyle(color: Colors.black45),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' privacy policy',
                                style: TextStyle(color: Colors.green)),
                            TextSpan(
                              text: ' and',
                              style: TextStyle(color: Colors.black45),
                            ),
                            TextSpan(
                                text: ' Terms',
                                style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediQuery.height * .03,
                  ),
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
                  isLoading? SizedBox(
                    height: 20,
                  ):Container(),
                  
                  DefaultButton(
                    text: 'SIGN UP',
                    press: () {
                      String email, password , name , passwordConf;
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                        setState(() {
                          isLoading = true;
                        });
                        name = _nameController.text.trim();
                        email = _emailController.text.trim();
                        password = _passwordController.text;
                        passwordConf = _passwordConfirmController.text;
                        signinData(name,email, password,passwordConf);
                      }
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 9, bottom: 5),
              alignment: Alignment.center,
              child: Text(
                "Or use social media accounts ",
                style: TextStyle(
                    fontSize: mediQuery.width * .045,
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
                  margin: EdgeInsets.only(left: 15, right: 15),
                  width: mediQuery.width * .33,
                  height: mediQuery.height * .06,
                ),
                Container(
                  child: Image.asset(
                    'images/google.jpg',
                    fit: BoxFit.fill,
                  ),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  width: mediQuery.width * .33,
                  height: mediQuery.height * .063,
                ),
              ],
            ),
            SizedBox(
              height: mediQuery.height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'if you already have an account please ',
                  style: TextStyle(
                    fontSize: mediQuery.width * .042,
                    color: Colors.black45,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    'SIGN IN ',
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

  signinData(String name, String email, String password,
      String passwordConfirmation) async {
    try {
      print("body : $name   $email    $password    $passwordConfirmation");
      var url = "https://api.hvacrtoolbox.com/api/auth/register";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "name": "$name",
          "email": "$email",
          "password": "$password",
          "password_confirmation": "$passwordConfirmation"
        }),
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
          message = "${data["errors"]}";
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
