import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/app/modules/login/views/login_view.dart';
import 'package:restaurant_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:restaurant_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:restaurant_app/app/routes/app_pages.dart';

import '../modules/home/views/home_view.dart';
import '../modules/profile/views/profile_view.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 150,
          left: 20,
          right: 20,
          bottom: 0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5CC2E0),
                  Color(0xFF805CFF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
            ),
            child: Column(
              children: [
                // Line Border
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 2,
                  width: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),

                // Profile Image | Name
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.offNamed(
                      Routes.PROFILE,
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, left: 26),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0xFFE5E2FD),
                            width: 1,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Obx(() => Text(
                                  Get.find<ProfileController>()
                                          .userProfile
                                          .value
                                          .clientName ??
                                      '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // End Line Border
                Container(
                  margin: const EdgeInsets.only(
                      top: 30, bottom: 20, left: 26, right: 26),
                  height: 1,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 244, 247, 0.47),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),

                // Drawer Menu Items (View Restaurants, View Profile, Logout(end of list))
                DrawerMenuItem(
                  icon: Icons.restaurant,
                  title: 'View Restaurants',
                  onTap: () {
                    Get.back();
                    Get.offNamed(
                      Routes.HOME,
                    );
                  },
                ),
                const SizedBox(height: 13),
                DrawerMenuItem(
                  icon: Icons.person,
                  title: 'View Profile',
                  onTap: () {
                    Get.back();
                    Get.offNamed(
                      Routes.PROFILE,
                    );
                  },
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: DrawerMenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      Get.back();
                      Get.off(
                        () => const LoginView(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    showForwardArrow: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.showForwardArrow = true,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final Function onTap;
  final bool? showForwardArrow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(left: 26, right: 26),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Expanded(child: Container()),
            if (showForwardArrow!)
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}
