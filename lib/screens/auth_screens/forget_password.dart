import 'package:flutter/material.dart';

import '../../widgets/appBar.dart';
import '../../widgets/custom_text_form.dart';
import '../../widgets/default_button.dart';
import '../../widgets/textOnFields.dart';

class ForgetPassword extends StatelessWidget {
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
                CustomTextForm(false, 'Enter email'),

                SizedBox(
                  height: mediQuery.height * .04,
                ),
                DefaultButton(
                  text: 'SEND',
                  press: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
