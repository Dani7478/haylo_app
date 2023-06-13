

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
 

 storeDataInString({keyname,stringValue}) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString(keyname,stringValue);
 }


 getToken()  async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
  return  prefs.getString('token');

 }


}