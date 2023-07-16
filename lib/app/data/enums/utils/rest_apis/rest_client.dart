import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetX;
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/app/data/constants/app_constatnts.dart';
import 'package:restaurant_app/app/data/enums/utils/rest_apis/endpoints.dart';

import '../../../../models/login_user_model.dart';
import 'network_util.dart';

class RestClient {
  late NetworkUtil netUtil;
  late Dio dio;

  RestClient() {
    netUtil = NetworkUtil(baseAPIURL);
    dio = Dio();
  }

  final storage = GetStorage();

  /**
   *  USER API's
   */

  // Login
  Future<LoginUserModel> login(
      {required String phone, required String password}) async {
    LoginUserModel user = LoginUserModel();
    var body = {"phone_number": phone, "password": password};
    await netUtil.post(loginURL, body: body).then((value) async {
      try {
        if (value['user']["client_id"] != null) {
          user = LoginUserModel.fromJson(value['user']);
          storage.write(kToken, "${value['token']}"); // store token
        }
      } catch (e) {
        GetX.Get.snackbar('Login', "${value['message']}",
            snackPosition: GetX.SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3));
      }
    });
    return user;
  }
}
