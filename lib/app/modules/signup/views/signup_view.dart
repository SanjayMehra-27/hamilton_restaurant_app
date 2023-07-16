import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          // To Hide Keyboard When Tapped Outside
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // Signup Title & Back Button In Appbar
                AppBar(
                  title: const Text('Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      )),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: const Color(0xff805FFE),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Signup Form With 5 TextFields[Outline border] (Username, Full Name, Email, Phone, Password(With Visibility Toggle)) & checkbox for terms & conditions
                Column(
                  children: [
                    // Username TextField
                    Form(
                      key: controller.usernameFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: PrimaryTextField(
                        controller: controller.usernameTextController.value,
                        labelText: 'Username',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username is required';
                          } else if (value.length < 3) {
                            return 'Username must be at least 3 characters';
                          } else if (value.length > 20) {
                            return 'Username must be at most 20 characters';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Full Name TextField
                    Form(
                      key: controller.fullnameFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: PrimaryTextField(
                        controller: controller.fullnameTextController.value,
                        labelText: 'Full Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Full Name is required';
                          } else if (value.length < 3) {
                            return 'Full Name must be at least 3 characters';
                          } else if (value.length > 20) {
                            return 'Full Name must be at most 20 characters';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Email TextField
                    Form(
                      key: controller.emailFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: PrimaryTextField(
                        controller: controller.emailTextController.value,
                        labelText: 'Email',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          } else if (!value.isEmail) {
                            return 'Please enter a valid email address';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Phone TextField
                    Form(
                      key: controller.phoneFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: PrimaryTextField(
                        controller: controller.phoneTextController.value,
                        labelText: 'Phone',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone is required';
                          } else if (value.length < 10) {
                            return 'Phone must be at least 10 characters';
                          } else if (value.length > 10) {
                            return 'Phone must be at most 10 characters';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Password TextField
                    Obx(() => Form(
                          key: controller.passwordFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: PrimaryTextField(
                            controller: controller.passwordTextController.value,
                            labelText: 'Password',
                            obscureText: !controller.isPasswordVisible.value,
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isPasswordVisible.toggle();
                              },
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              } else if (value.length > 20) {
                                return 'Password must be at most 20 characters';
                              }
                            },
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    // Terms & Conditions Checkbox
                    GestureDetector(
                      onTap: () {
                        controller.isTermsAccepted.toggle();
                      },
                      child: Row(
                        children: [
                          // Custom Checkbox with Rounded Border
                          Obx(
                            () => Container(
                              height: 23,
                              width: 23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: controller.isTermsAccepted.value
                                      ? const Color(0xff805FFE)
                                      : Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: controller.isTermsAccepted.value
                                  ? const Icon(Icons.check,
                                      size: 15, color: Color(0xff805FFE))
                                  : null,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // Terms & Conditions Text
                          Expanded(
                            child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                  text: 'I agree with the company\'s ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: 'privacy policy',
                                  style: TextStyle(
                                    color: Color(0xff4E3AAD),
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: 'terms of service',
                                  style: TextStyle(
                                    color: Color(0xff4E3AAD),
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                // Expanded(child: Container()),
                // Signup Button
                GestureDetector(
                  onTap: () {
                    controller.signup();
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff805FFE),
                      ),
                      child: Center(
                        child: Obx(
                          () => controller.isLoading.value
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.obscureText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: const Color(0xff805FFE),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xff444444),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffC3C7E5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff805FFE),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
