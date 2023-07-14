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
            child: Column(
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
                    TextFormField(
                      cursorColor: const Color(0xff805FFE),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        labelText: 'Username',
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
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Full Name TextField
                    TextFormField(
                      cursorColor: const Color(0xff805FFE),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        labelText: 'Full Name',
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
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Email TextField
                    TextFormField(
                      cursorColor: const Color(0xff805FFE),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        labelText: 'Email',
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
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Phone TextField
                    TextFormField(
                      cursorColor: const Color(0xff805FFE),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        labelText: 'Phone',
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
                        // prefixIcon: Container(
                        //   width: 65,
                        //   margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        //   child: Row(
                        //     children: [
                        //       Center(
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: const Text(
                        //             '+91',
                        //             style: TextStyle(
                        //               color: Color(0xff444444),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Password TextField
                    TextFormField(
                      cursorColor: const Color(0xff805FFE),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        labelText: 'Password',
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
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_outlined),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Terms & Conditions Checkbox
                    Row(
                      children: [
                        // Custom Checkbox with Rounded Border
                        Container(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color:
                                  false ? const Color(0xff805FFE) : Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: false
                              ? const Icon(
                                  Icons.check,
                                  size: 15,
                                  color:
                                      false ? Color(0xff805FFE) : Colors.grey,
                                )
                              : null,
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
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: Container()),
                // Signup Button
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff805FFE),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
