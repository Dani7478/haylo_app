import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Model/conservation.dart';
import 'package:haylo_app/Model/message.dart';
import 'package:haylo_app/Services/api_service.dart';
import 'package:haylo_app/Services/local_storage.dart';

import '../../Model/user.dart';
import '../api.dart';
import '../toast.dart';

class ChattingController extends GetxController {
  List<Conservation> conservationList = [];
  List<Messages> messagesList = [];
  int? selfId;
  int? recievedId;
  bool isLoading = true;




  @override
  onInit() {
    getAllData();
    super.onInit();
  }



 Future<void>  getAllData() async {
    isLoading = true;
    update();

    User? user = await LocalStorage().getUserData();
    selfId = int.parse(user!.id.toString());
    getConservations(selfId!);

    isLoading = false;
    update();
  }

  getConservations(int id) async {
    conservationList.clear();
    String link = '$getConservationsUrl${id.toString()}';
    print(link);
    var response = await ApiService().getApiDatawithToken(url: link);
    var jsonData = json.decode(response);
    if (jsonData['status'] == true) {
      customToast(jsonData['message']);
      for (int i = 0; i < jsonData['data'].length; i++) {
        var singleCons = Conservation.fromJson(jsonData['data'][i]);
        conservationList.add(singleCons);
      }
      update();
    } else {
      customToast(jsonData['message']);
    }
    print(jsonData);
    for (int i = 0; i < jsonData.length; i++) {
      print(jsonData[i]);
      // var conser = Conservation.fromJson(jsonData[i]);
      // conservationList.add(conser);
    }
    update();
  }

 getMessages(int receiverId) async {
    messagesList.clear();
    String link = '$getMessagesUrl$selfId/$receiverId';
   var response = await ApiService().getApiDatawithoutToken(url: link);
   var jsonData=json.decode(response);

   if(jsonData['status']==true){
       customToast(jsonData['message']);
     print('Data Length : ${jsonData['data'].length}');

     for(int i=0; i<jsonData['data'].length; i++){
       Messages singleMsg=Messages.fromJson(jsonData['data'][i]);
       messagesList.add(singleMsg);
     }
     print('List of Messages : ${messagesList.length}');
     isLoading=false;
     update();
   }else {
     customToast(jsonData['message']);
     isLoading=false;
     update();
   }

  }
}
