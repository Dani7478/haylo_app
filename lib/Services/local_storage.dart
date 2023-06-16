import 'dart:convert';
import 'package:haylo_app/Controller/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user.dart';

class LocalStorage {
  storeDataInString({keyname, stringValue}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyname, stringValue);
  }

  getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  clearCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<User?> getUserData() async {
    String data=await getString(keyName: 'userData');
    Map<String,dynamic> response= json.decode(data);
    print(response);
   User user = User.fromJson(response['data']);
    return user;
  }

  getString({keyName}) async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyName);
  }

  setString({keyName, keyValue}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyName, keyValue);

  }
}
