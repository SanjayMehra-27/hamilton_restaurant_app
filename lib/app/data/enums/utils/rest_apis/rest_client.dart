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
  Future<UserModel> login(
      {required String phone, required String password}) async {
    UserModel user = UserModel();
    var body = {"phone_number": phone, "password": password};
    await netUtil.post(loginURL, body: body).then((value) async {
      try {
        if (value['user']["client_id"] != null) {
          user = UserModel.fromJson(value['user']);
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

  // Signup
  Future<UserModel> signup(
      {required String phone,
      required String username,
      required String password,
      required String name,
      required String email}) async {
    UserModel user = UserModel();
    var body = {
      "Name": name,
      "Email": email,
      "phone_number": phone,
      "Password": password,
      "confirm_password": password,
      "Country": 91,
      "UserName": username
    };
    await netUtil.post(signUpURL, body: body).then((value) async {
      try {
        if (value['User']["client_id"] != null) {
          user = UserModel.fromJson(value['User']);
          storage.write(kToken, "${value['token']}"); // store token
        }
      } catch (e) {
        GetX.Get.snackbar('Signup', "${value['message']}",
            snackPosition: GetX.SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3));
      }
    });
    return user;
  }
}
