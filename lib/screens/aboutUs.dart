
import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
class AboutUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:appbar(context,"About Us" , true),
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
                  child: Column(
            children:<Widget>[
              SizedBox(height: 60,),
              Center(child: Image(image: AssetImage("logos/logo_h.png"), width: width*0.7)),
              SizedBox(height: 40,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.9,
                child: Column(
                  children: [
                    Text("We are a platform that is a website and mobile application that contains a database of refrigeration compressors, refrigerators and air conditioners of various kinds for most of the well-known international brands. By searching within this database, the following information is obtained:"
                    , style:TextStyle(
                      color:Colors.black45,
                      fontSize:width*0.05
                    )
                    ),
                     SizedBox(height: 30,),
                    Text( "Compressor specifications;\nEquivalent compressor of various other brands;\nRefrigerator or air conditioner specifications. "
                    , style:TextStyle(
                      color:Colors.black45,
                      fontSize:width*0.05
                    )
                    ),
                     SizedBox(height: 30,),
                    Text("The site also contains a reference for the trouble codes for:\n\nDigital refrigerators;\nDigital Air Conditioners;\nAutomatic washing machines."
                    , style:TextStyle(
                      color:Colors.black45,
                      fontSize:width*0.05
                    )
                    ),
                    SizedBox(height: 30,),
                    Text("This platform contains a library that includes many books, catalogs, references and specialized training courses.\n\nIt is considered the first of its kind in the field of refrigeration and air conditioning, because it contains data related to most companies, unlike other platforms for each company separately.\n\nOur goal is to provide all the information needed by those working in the field of refrigeration and air conditioning, whether an engineer, technician or student, in one place, to make it easy for him to access the information.\n\nIt is worth noting that the catalogs on the site are catalogs owned by the companies producing their own product, and the purpose of their compilation is easy access to information, spreading science, and helping knowledge seekers.\n\nThe platform welcomes the cooperation of the companies producing the products covered by the site in terms of providing information, or contributing to the development of the site by supplying it with all updated products."
                    , style:TextStyle(
                      color:Colors.black45,
                      fontSize:width*0.05
                    )
                    ),
                    SizedBox(height: 60,),
                  ],
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}
