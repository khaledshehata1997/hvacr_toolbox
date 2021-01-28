import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../widgets/appBar.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/default_button.dart';
import '../../widgets/textOnFields.dart';
import 'changeForgotPassword.dart';

class ForgetPassword extends StatefulWidget {

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String message = "";
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, 'FORGET YOUR PASSWORD', false),
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
                    'We will send a reset mail to change your password ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: mediQuery.height * .085,
                  ),
                  textOnFields(context, 'Email', false),
                  CustomTextForm(false, 'Enter email' , controller: _emailController,),

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
                   isLoading? SizedBox(
                      height: 20,
                    ):Container(),
                  DefaultButton(
                    text: 'SEND',
                    press: () {
                      if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          String email;
                          setState(() {
                            isLoading = true;
                          });

                          email = _emailController.text.toLowerCase();
                          resetPassowrd(email);
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
  resetPassowrd(String email) async {
    try {
      var url = "https://api.hvacrtoolbox.com/api/password/email";

      var request = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
          jsonEncode(<String, String>{'email': email}),
      );
      print(request.body);
      var data = jsonDecode(request.body);

      if ("${data['success']}" == "true") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangeForgotPassword(email)),
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
