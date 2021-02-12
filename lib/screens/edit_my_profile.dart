import 'package:flutter/material.dart';
import 'package:hvacr_tool_box/widgets/appBar.dart';
import 'package:hvacr_tool_box/widgets/custom_text_form.dart';
import 'package:hvacr_tool_box/widgets/default_button.dart';
import 'package:hvacr_tool_box/widgets/textOnFields.dart';

class EditMyProfile extends StatelessWidget {
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
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     textOnFields(context,'First name',true),
                     CustomTextForm(false, 'enter first name'),
                     SizedBox(
                       height: mediQuery.width * .05,
                     ),

                     textOnFields(context,'Last name',true),
                     CustomTextForm(false, 'enter last name '),
                     SizedBox(
                       height: mediQuery.width * .05,
                     ),

                     textOnFields(context,'Email',true),
                     CustomTextForm(false, 'enter email '),

                   ],
                 ),
               ),
               SizedBox(height: mediQuery.height*.04,),
               DefaultButton(text: 'SAVE',
                 press: (){},
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
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     textOnFields(context,'Old password',true),
                     Stack(
                       children: [
                         CustomTextForm(true, 'old password'),
                         Positioned(
                             top: mediQuery.height * .022,
                             left: mediQuery.width * .7,
                             child: GestureDetector(
                                 onTap: () {

                                 },
                                 child: Icon(
                                   Icons.remove_red_eye_outlined,
                                   color: Colors.black45,
                                 )))
                       ],
                     ),
                     SizedBox(
                       height: mediQuery.width * .05,
                     ),
                     textOnFields(context,'New password',true),
                     Stack(
                       children: [
                         CustomTextForm(true, 'new password'),
                         Positioned(
                             top: mediQuery.height * .022,
                             left: mediQuery.width * .7,
                             child: GestureDetector(
                                 onTap: () {

                                 },
                                 child: Icon(
                                   Icons.remove_red_eye_outlined,
                                   color: Colors.black45,
                                 )))
                       ],
                     ),
                     SizedBox(
                       height: mediQuery.width * .05,
                     ),
                     textOnFields(context,'Confirm new password',true),
                     Stack(
                       children: [
                         CustomTextForm(true, 'confirm password'),
                         Positioned(
                             top: mediQuery.height * .022,
                             left: mediQuery.width * .7,
                             child: GestureDetector(
                                 onTap: () {

                                 },
                                 child: Icon(
                                   Icons.remove_red_eye_outlined,
                                   color: Colors.black45,
                                 )))
                       ],
                     ),

                   ],
                 ),
               ),
               SizedBox(
                 height: mediQuery.width * .08,
               ),
               DefaultButton(text: 'SAVE',
                 press: (){},
               )
             ],
           ),
         )
        ],
      ),
    );
  }
}
