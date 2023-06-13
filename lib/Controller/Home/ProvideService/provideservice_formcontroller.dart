import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haylo_app/Controller/api.dart';
import 'package:haylo_app/Services/local_storage.dart';
import 'package:haylo_app/Controller/toast.dart';
import 'package:haylo_app/Services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:fluttertoast/fluttertoast.dart';

import '../../../View/Common Widgets/navigate.dart';
import '../../../View/Screens/Home/ProvideService/provide_category_formview.dart';

class ProvideProfileFormController extends GetxController {
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool isLoading = false;
  bool passwordshow = false;
  bool isTermsOk = false;
  File? image;
  var multiPartImage;


//_______________________________change terms function 
  changeIsTerm() {
    isTermsOk = !isTermsOk;
    update();
  }



  //_____________________is password show 
  changePasswordShowe() {
    passwordshow = !passwordshow;
    update();
  }

  // selectImageFromGal() async {
  //   ImagePicker imagePick = ImagePicker();
  //   var fileimage = await imagePick.pickImage(source: ImageSource.gallery);
  //   image = File(fileimage!.path);
  //   multiPartImage = await convertImageToMultipartFile(image!);
  // }


  //______________________________submit provider 

  submitProvider() async {
    isLoading = true;
    update();
    Map<String, dynamic> providerData = {
      'signup_as': '1', // 1 means signup as a provider
      'first_name': firstNameCtrl.text,
      'last_name': lastNameCtrl.text,
      'email': emailCtrl.text,
      // 'image': multiPartImage,
      'password': passwordCtrl.text
    };
  

    var dataBody = await ApiService().postApiWithOutToken(providerData, signUpUrl);
    var decodData = json.decode(dataBody);
    print(decodData.toString());
    if (decodData['status'] == false) {
      customToast(decodData['message']);
    } else {
      customToast(decodData['message']);
      LocalStorage().storeDataInString(
          keyname: 'token', stringValue: decodData['data']['token']);
           moveRTL(screen: const ProvideGategoryFormView());
    }
    isLoading = false;
    update();
  }

  Future<http.MultipartFile> convertImageToMultipartFile(File imageFile) async {
    var fileStream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var multipartFile = http.MultipartFile(
      'image',
      fileStream,
      length,
      filename: path.basename(imageFile.path),
      contentType: MediaType('image',
          'jpeg'), // Adjust the content type according to your image format
    );

    return multipartFile;
  }
}
