import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //post data without token

  postApiWithOutToken(data, url) async {
    var header = {"key": "Accept", "value": "application/json", "type": "text"};
    var apiUrl = Uri.parse(url);

    try {
      var response = await http.post(apiUrl, body: data, headers: header);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        customToast('Something went wrong');
      }
    } catch (error) {
      customToast('Something went wrong');
    }
  }

  postApiWithToken(data, url) async {
       var token = await LocalStorage().getToken();
    var header = {
      'Authorization': 'Bearer $token',
    };
    var apiUrl = Uri.parse(url);

    try {
      var response = await http.post(apiUrl, body: data, headers: header);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        customToast('Something went wrong');
      }
    } catch (error) {
      customToast('Something went wrong');
    }
  }



//get data with token
  getApiDatawithToken({url}) async {
    var token = await LocalStorage().getToken();
    var header = {
      'Authorization': 'Bearer $token',
    };
   
    var apiUrl = Uri.parse(url);
    var response = await http.get(apiUrl, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      customToast('Something went Wrong');
    }
  }
}
