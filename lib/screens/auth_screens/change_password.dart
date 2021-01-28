import 'package:flutter/material.dart';

import '../../widgets/appBar.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/default_button.dart';
import '../../widgets/textOnFields.dart';

class ChangePassWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, 'CHANGE YOUR PASSWORD', false),
      body: ListView(
        children: [
          SizedBox(height: mediQuery.height*.08,),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'please notice that the password that you will enter you gonna use it to login to your profile in future ',
                  style: TextStyle(
                    fontSize:20,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(height: mediQuery.height*.085,),
                textOnFields(context, 'New Password', false),
                CustomTextForm(true, 'ادخل الرقم السري'),
                SizedBox(height: mediQuery.height*.04,),
                textOnFields(context, 'Confirm Password', false),
                CustomTextForm(true, 'ادخل الرقم السري'),
                SizedBox(height: mediQuery.height*.05,),
                DefaultButton(
                  text: 'CONFIRM PASSWORD',
                  press:(){

                  } ,
                )
              ],
            ),
          )
        ],
      ),
    );

  }
}
