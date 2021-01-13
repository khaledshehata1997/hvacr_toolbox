import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/screens/auth_screens/sign_up.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey _globalKey = GlobalKey();
  var keepMeLoggedIn=false;

  var _obscure = true;

  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(context, 'LOG IN' , false),
      body: Form(
        key: _globalKey,
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
                  CustomTextForm(false, 'ادخل الايميل'),
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
                        'Remember me',
                        style: TextStyle(color: Colors.black45),
                      )
                    ],
                  ),
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
                  DefaultButton(
                    text: 'LOG IN',
                    press: () {},
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
                  child: Image.asset('images/Topic-Facebook.jpg',fit: BoxFit.fill,),
                  margin: EdgeInsets.all(15),
                  width: mediQuery.width * .33,
                  height: mediQuery.height * .063,
                ),
                Container(
                  child: Image.asset('images/google.jpg',fit: BoxFit.fill,),
                  margin: EdgeInsets.all(15),
                  width: mediQuery.width * .33,
                  height: mediQuery.height * .063,
                ),
              ],
            ),
            SizedBox(height: mediQuery.height*.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('if you don’t have an account please ', style: TextStyle(
                    fontSize: mediQuery.width * .042,
                    color: Colors.black45,
                ),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));

                  },
                  child: Text('SIGN UP ', style: TextStyle(
                    fontSize: mediQuery.width * .05,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
