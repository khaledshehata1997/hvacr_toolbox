import 'package:hvacr_tool_box/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveTok(token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
    print("saved in prefren token : $token");
}


Future<String> readTok(context) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? "";
    print('read token : $value');
    signData.setToken(value);
    return value;
}

Future<bool> checkSignIn(context) async {
    SignData signData = Provider.of<SignData>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key);
    print('read token : $value');
    signData.setToken(value);
    return value == null;
  }