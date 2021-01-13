import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';

import 'Sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey _globalKey = GlobalKey();
  var keepMeLoggedIn = false;
  var checkPrivcyPolicy = false;
  var _obscure = true;

  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, 'SIGN UP', false),
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(left: 12, right: 12,top: 7),
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
                  Text(
                    " name",
                    style: TextStyle(
                        fontSize: mediQuery.width * .045,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                  CustomTextForm(false, 'ادخل الاسم '),
                  SizedBox(
                    height: mediQuery.width * .005,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        fontSize: mediQuery.width * .045,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                  CustomTextForm(false, 'ادخل الايميل'),
                  SizedBox(
                    height: mediQuery.width * .005,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        fontSize: mediQuery.width * .045,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                  Stack(
                    children: [
                      CustomTextForm(_obscure, 'ادخل الرقم السري'),
                      Positioned(
                          top: mediQuery.height * .025,
                          left: mediQuery.width * .8,
                          child: GestureDetector(
                              onTap: () {
                                _obscure != _obscure;
                              },
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black45,
                              )))
                    ],
                  ),
                  Text(
                    "Confirm password",
                    style: TextStyle(
                        fontSize: mediQuery.width * .045,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                  Stack(
                    children: [
                      CustomTextForm(_obscure, 'ادخل الرقم السري'),
                      Positioned(
                          top: mediQuery.height * .025,
                          left: mediQuery.width * .8,
                          child: GestureDetector(
                              onTap: () {
                                _obscure != _obscure;
                              },
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black45,
                              )))
                    ],
                  ),
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
                          text: 'I have read and consent to the HVACR\n TOOLBOX',
                          style: TextStyle(color: Colors.black45),
                          children: <TextSpan>[
                            TextSpan(text: ' privacy policy', style: TextStyle(color: Colors.green)),
                            TextSpan(text: ' and',style: TextStyle(color: Colors.black45),),
                            TextSpan(text: ' Terms', style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: mediQuery.height * .03,
                  ),
                  DefaultButton(
                    text: 'SIGN UP',
                    press: () {},
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
}
