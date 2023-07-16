import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/app/modules/home/bindings/home_binding.dart';

import '../../../data/enums/utils/rest_apis/rest_client.dart';
import '../../../models/login_user_model.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  final user = LoginUserModel().obs;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final isLoading = false.obs;

  // Rest Client
  final RestClient restClient = RestClient();

  Future<void> login() async {
    // Validate
    if (emailTextController.value.text.isEmpty) {
      Get.snackbar('Error', 'Please enter email');
      return;
    }
    if (passwordTextController.value.text.isEmpty) {
      Get.snackbar('Error', 'Please enter password');
      return;
    }
    try {
      isLoading.value = true;
      user.value = await restClient.login(
          phone: emailTextController.value.text,
          password: passwordTextController.value.text);
      isLoading.value = false;
      if (user.value.clientId != null) {
        Get.off(
          () => const HomeView(),
          binding: HomeBinding(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 200),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
