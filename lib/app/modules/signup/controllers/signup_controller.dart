import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/app/models/login_user_model.dart';
import 'package:restaurant_app/app/routes/app_pages.dart';

import '../../../data/enums/utils/rest_apis/rest_client.dart';

class SignupController extends GetxController {
  final user = UserModel().obs;

  final usernameTextController = TextEditingController().obs;
  final fullnameTextController = TextEditingController().obs;
  final emailTextController = TextEditingController().obs;
  final phoneTextController = TextEditingController().obs;
  final passwordTextController = TextEditingController().obs;

  final isTermsAccepted = false.obs;
  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  RestClient restClient = RestClient();

  // Form Keys
  final usernameFormKey = GlobalKey<FormState>();
  final fullnameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final phoneFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    if (await validateForm() == false) {
      return;
    }
    isLoading.value = true;
    user.value = await restClient.signup(
      username: usernameTextController.value.text,
      name: fullnameTextController.value.text,
      email: emailTextController.value.text,
      phone: phoneTextController.value.text,
      password: passwordTextController.value.text,
    );
    isLoading.value = false;
    if (user.value.clientId != null) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  // Validator
  Future<bool> validateForm() async {
    if (usernameFormKey.currentState!.validate() &&
        fullnameFormKey.currentState!.validate() &&
        emailFormKey.currentState!.validate() &&
        phoneFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate()) {
      if (isTermsAccepted.value == false) {
        Get.snackbar('Terms & Conditions', 'Please accept terms & conditions',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3));
        return false;
      }
      usernameFormKey.currentState!.save();
      fullnameFormKey.currentState!.save();
      emailFormKey.currentState!.save();
      phoneFormKey.currentState!.save();
      passwordFormKey.currentState!.save();
      return true;
    } else {
      return false;
    }
  }
}
