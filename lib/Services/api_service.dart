import 'dart:convert';

import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:http/http.dart' as http;

import '../Controller/api.dart';
import '../Model/service.dart';

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
    print(header);
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
      print(response.body);
      return response.body;
    } else {
      customToast('Something went Wrong');
    }
  }

  getApiDatawithoutToken({url}) async {
    var apiUrl = Uri.parse(url);
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      customToast('Something went Wrong');
    }
  }

  //________________________get all services
  getAllServices() async {
    var response = await getApiDatawithToken(url: serviceCatUrl);
    var jsonResponse = json.decode(response);
    List<Service> serviceList = [];

    for (int i=0; i<jsonResponse['data'].length ;i++) {
      print(jsonResponse['data'][i]);
      Service service = Service.fromJson(jsonResponse['data'][i] as Map<String,dynamic>);
      serviceList.add(service);
    }
    return serviceList;
  }
}
