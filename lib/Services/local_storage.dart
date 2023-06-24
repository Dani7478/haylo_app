import 'dart:convert';
import 'package:haylo_app/Controller/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/user.dart';

class LocalStorage {

  //________________store String data in local storage
  storeDataInString({keyname, stringValue}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyname, stringValue);
  }

  //________________getting user token
  getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    return prefs.getString('token');
  }

  //________________clear local Storage
  clearCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  //_______________get saved user Data
  Future<User?> getUserData() async {
    User? user;
    String data=await getString(keyName: 'userData');
    if(data.isNotEmpty){
      Map<String,dynamic> response= json.decode(data);
      print(response);
       user = User.fromJson(response['data']);
    }

    return user;
  }

  //_______________get string in local storage
  getString({keyName}) async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyName);
  }

  //_______________store data in string
  setString({keyName, keyValue}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyName, keyValue);
  }

  //_______________is user Saved or not
  isUserSaved() async {
    try{
      var token= getString(keyName: 'token');
      if(token==null){
        return 0;
      }else {
        User? user =await getUserData();
        return int.parse(user!.type.toString());
      }
    }catch(error){
      return 0;
    }

  }

}
