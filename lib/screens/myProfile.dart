import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/default_button.dart';

class MyProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, "My Profile", true),
      body: Container(
        padding: EdgeInsets.only(top:20),
        width: mediaQuery.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                        padding: EdgeInsets.all(15),
                        width: mediaQuery.width * .9,
                        

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
                            
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "name",
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
                              "Mohamed ahmed mohamed",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              height: 30,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
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
                            
                            Divider(
                              thickness: 2,
                              height: 30,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.lock,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "password",
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
                              "*********",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black45,
                              ),
                            ),

                            
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 30,),
                      DefaultButton(text:"EDIT PROFILE" , press: (){},)
          ],
        ),
      ),
    );
  }
}