import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/app/data/enums/utils/rest_apis/custom_interceptor.dart';

import '../../../constants/app_constatnts.dart';

class NetworkUtil {
  NetworkUtil.internal();
  static final NetworkUtil _instance = NetworkUtil.internal();
  static Dio? dio;
  static String token = "";

  factory NetworkUtil(String baseUrl) {
    dio = Dio();
    token = GetStorage().read(kToken) ?? "";
    (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio?.options.baseUrl = baseUrl;
    dio?.options.connectTimeout = 120000; //120s
    dio?.options.receiveTimeout = 120000; //120s
    dio?.interceptors.add(CustomInterceptor());
    return _instance;
  }

  static getBasicAuth(String username, String token) {
    return "Basic ${base64.encode(utf8.encode(username + ":" + token))}";
  }

  Future<dynamic> get(var url, {Options? options}) async {
    Response response =
        await dio!.get(url, options: options).catchError((error) {
      return error.response;
    });
    return response.data;
  }

  Future<dynamic> post(String url, {required dynamic body}) async {
    Response response = await dio!.post(url, data: body).catchError((error) {
      return error.response;
    });
    return response.data;
  }

  Future<dynamic> put(String url, {required dynamic body}) async {
    Response response = await dio!.put(url, data: body).catchError((error) {
      return error.response;
    });
    return response.data;
  }

  Future<dynamic> delete(var url, {dynamic body}) async {
    Response response = await dio!.delete(url, data: body).catchError((error) {
      return error.response;
    });
    return response.data;
  }
}
