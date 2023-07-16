import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/app/modules/home/bindings/home_binding.dart';

import '../../../data/enums/utils/rest_apis/rest_client.dart';
import '../../../models/login_user_model.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  final user = UserModel().obs;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final isLoading = false.obs;

  // Form Keys
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  // Rest Client
  final RestClient restClient = RestClient();
  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    // Validate
    if (await validateForm() == false) {
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

  // Validator
  Future<bool> validateForm() async {
    if (emailFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate()) {
      emailFormKey.currentState!.save();
      passwordFormKey.currentState!.save();
      return true;
    }
    return false;
  }
}
