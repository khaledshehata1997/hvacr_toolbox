import 'package:http/http.dart'as http;
import 'package:hvacr_tool_box/models/login_model.dart';
import 'dart:convert';
class ApiService{
  Future<LoginResponseModel>login(LoginRequestModel requestModel)async{
    String url="https://www.getpostman.com/collections/8787b2c56f9d7e832048";
    final response = await http.post(url,body: requestModel.toJson());
    if(response.statusCode==200){
      return LoginResponseModel.fromJson(json.decode(response.body));

    }else{
      throw Exception('faild to load data');
    }
  }
}