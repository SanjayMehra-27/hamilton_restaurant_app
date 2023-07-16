import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/app/data/constants/app_constatnts.dart';
import 'package:restaurant_app/app/modules/login/bindings/login_binding.dart';

import 'app/routes/app_pages.dart';
import 'app/services/push_notification_service.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await PushNotificationService().setupInteractedMessage();

  runApp(
    GetMaterialApp(
      title: "Hamilton Restaurant App",
      initialRoute:
          GetStorage().read(kToken) != null ? Routes.HOME : AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: LoginBinding(),
      debugShowCheckedModeBanner: false,
    ),
  );
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    // App received a notification when it was killed
  }
}
