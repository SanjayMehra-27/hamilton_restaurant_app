import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetX;
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_app/app/data/enums/utils/rest_apis/network_util.dart';

import '../../../../routes/app_pages.dart';

class CustomInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Apply token if available
    if (NetworkUtil.token.isNotEmpty || NetworkUtil.token != "") {
      options.headers['authorization'] = NetworkUtil.token;
    }

    if (kDebugMode) {
      log("------------- START : NEW Request   ------------------");
      log(options.uri.data.toString());
      log(options.uri.path.toString());
      log(options.headers.toString());
      //print(json.encode(options.data));
      log(options.data.toString());
      log("------------- END : NEW Request   ------------------");
    }
    return handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      log("------------- START : NEW Response   ------------------");
      log(response.headers.toString());
      log(response.data.toString());
      log("------------- END : NEW Response   ------------------");
    }
    return handler.next(response);
  }

  @override
  Future<void> onError(DioError error, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      log("-------------  Error   ------------------");
      log('requestOptions > ${error.requestOptions.data}');
      log('message > ${error.message}');
    }
    if (error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      if (GetX.Get.isDialogOpen != null && GetX.Get.isDialogOpen!) {
        return;
      }
      showErrorDialog(
        title: 'Connection Timeout',
        message: 'Please check your internet connection and try again.',
      );
    } // SocketException
    else if (error.type == DioErrorType.other) {
      showErrorDialog(
        title: 'Connection Error',
        message: 'Please check your internet connection and try again.',
      );
      return;
    } else if (error.response?.statusCode == 500) {
      showErrorDialog(
        title: 'Internal Server Error (Code: 500)',
        message:
            'Please try again later.${kDebugMode ? "Route: " + error.requestOptions.path : ''}',
      );
    } else if (error.response?.statusCode == 401) {
      GetX.Get.offAllNamed(Routes.LOGIN);
    } else if (error.response?.statusCode == 429) {
      if (GetX.Get.isDialogOpen != null && GetX.Get.isDialogOpen!) {
        return;
      }

      showErrorDialog(
        title: 'Too Many Requests (Code: 429)',
        message:
            'Please do not make too many requests at once. Wait a while and try again.',
      );
    }
    return handler.next(error); //continue
  }
}

// App Default Error Dialog
showErrorDialog(
    {required String title,
    required String message,
    String? buttonText,
    bool? isDismissable = true}) {
  Get.dialog(
      AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, textAlign: TextAlign.start),
            const SizedBox(height: 5),
            Text(
              message,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.all(10),
        contentPadding: const EdgeInsets.all(10),
        actions: [
          TextButton(
            onPressed: () {
              GetX.Get.back();
            },
            child: Text(buttonText ?? 'OK'),
          ),
        ],
      ),
      barrierDismissible: isDismissable!);
}
