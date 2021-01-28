import 'package:flutter/material.dart';

class SignData extends ChangeNotifier{
  SignData();

  String token;
  void setToken(String tok){
    token = tok;
    notifyListeners();
  }
  String get getToken =>token;
}