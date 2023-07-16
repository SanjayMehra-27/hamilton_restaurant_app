import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/app/modules/home/views/home_view.dart';
import 'package:restaurant_app/app/modules/signup/bindings/signup_binding.dart';
import 'package:restaurant_app/app/modules/signup/views/signup_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF805CFF),
      persistentFooterButtons: [
        // Signup label & button
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(
                          () => const SignupView(),
                          transition: Transition.rightToLeft,
                          binding: SignupBinding(),
                        );
                      },
                    text: 'You don\'t have an account yet? ',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(
                              () => const SignupView(),
                              transition: Transition.rightToLeft,
                              binding: SignupBinding(),
                            );
                          },
                        text: 'Signup',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Login With label & buttons options such as Google, Facebook, Twitter, Apple, etc. in a row with square border radius & shadow with blur & spread radius
        //  1. Login With label with between a thick line
        Container(
          margin:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 10),
                  child: Divider(
                    color: Colors.white.withOpacity(0.5),
                    thickness: 1,
                  ),
                ),
              ),
              const Text(
                'Login With',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 20),
                  child: Divider(
                    color: Colors.white.withOpacity(0.5),
                    thickness: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
        //  2. Login With buttons options such as Google, Facebook, Twitter, Apple, etc. in a row with square border radius & shadow with blur & spread radius
        Container(
          margin: const EdgeInsets.only(top: 0, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Google button
              Container(
                height: 65,
                width: 65,
                margin: const EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Image(
                    image: AssetImage('assets/images/google_logo.png'),
                  ),
                ),
              ),
              // Apple button
              Container(
                height: 65,
                width: 65,
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Image(
                    image: AssetImage('assets/images/apple_logo.png'),
                  ),
                ),
              ),
              // Facebook button
              Container(
                height: 65,
                width: 65,
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Image(
                    image: AssetImage('assets/images/facebook_logo.png'),
                  ),
                ),
              ),
              // Twitter button
              Container(
                height: 65,
                width: 65,
                margin: const EdgeInsets.only(left: 10, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Image(
                    image: AssetImage('assets/images/twitter_logo.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: Get.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF5CC2E0),
                Color(0xFF805CFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.6],
              tileMode: TileMode.mirror,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.05),
                // Logo image & Skip button in a row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    // Logo image
                    const Expanded(
                        child:
                            Image(image: AssetImage('assets/images/logo.png'))),
                    // Skip button with label & icon >
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {
                          Get.to(
                            () => const HomeView(),
                            binding: SignupBinding(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 200),
                          );
                        },
                        label: const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.white),
                        icon: const Text('Skip',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),

                // Login form with glassmorphism effect | border radius | shadow with blur & spread radius & Login button
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.07),
                          blurRadius: 0.1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Login label
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 20, right: 20),
                          child: Text(
                            'Login your account',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        // Email textfield
                        Container(
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 0, left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Email textfield
                              Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: controller.emailTextController,
                                  decoration: const InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.person, color: Colors.grey),
                                    hintText: 'Email/Phone',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Password textfield
                        Container(
                          margin: const EdgeInsets.only(
                              top: 0, bottom: 20, left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Email textfield
                              Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: controller.passwordTextController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.grey),
                                    hintText: 'Password',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Forgot password label
                        GestureDetector(
                          onTap: () {},
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 0, left: 20, right: 20),
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),
                        // Login button filled with primary color with elevation
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const HomeView(),
                              binding: SignupBinding(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 200),
                            );
                          },
                          child: Container(
                            width: Get.width,
                            height: 60,
                            margin: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF795CE0),
                                  Color(0xFF4E3AAD),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                controller.login();
                              },
                              child: Obx(() => controller.isLoading.value
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('Login',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
