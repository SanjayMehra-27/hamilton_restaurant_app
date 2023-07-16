import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/app/data/enums/app_anums.dart';
import '../../../widgets/app_drawer.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../../../widgets/restaurant_card_widget.dart';
import '../../../widgets/restaurant_custom_tab.dart';
import '../../../widgets/status_bar_linear_background_widget.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      drawerScrimColor: Colors.transparent,
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
          const StatusBarLinearBackgroundWidget(),
          const CustomAppBar(showSettingsIcon: true),

          // Profile Picture (Circle Avatar) | Name & Username
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Obx(
              () => Column(
                children: [
                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage(
                      'assets/images/profile.png',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.userProfile.value.clientName ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '@${controller.userProfile.value.username ?? ''}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  if (controller.userProfile.value.bio != null)
                    const SizedBox(height: 13),
                  Text(
                    """${controller.userProfile.value.bio ?? ''}""",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFAAAAAA),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  if (controller.userProfile.value.bio != null)
                    const SizedBox(height: 17),
                  // Followers & Following
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Followers',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF444444),
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            '${controller.userProfile.value.followlist?.follower ?? 0}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF444444),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          const Text(
                            'Following',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF444444),
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            '${controller.userProfile.value.followlist?.following ?? 0}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF444444),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  // Follow & Message Buttons (Filled with Primary Color)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: Get.width * 0.45,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF805FFE),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Center(
                            child: Text(
                              'Follow',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      const SizedBox(width: 10),
                      Container(
                          width: Get.width * 0.3,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFF5cc2e0),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Center(
                            child: Text(
                              'Message',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 17),
                  // Line Divider
                  Container(
                    width: Get.width * 0.9,
                    height: 1,
                    color: const Color(0xFFE5E5E5),
                  ),

                  const SizedBox(height: 17),

                  // Rates, Visited & Favorites Tabs with count
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RestaurantCustomTab(
                          title: 'Rates',
                          count: '195',
                          isActive: false,
                          onTap: () {},
                        ),
                        RestaurantCustomTab(
                          title: 'Visited',
                          count: '300',
                          isActive: true,
                          onTap: () {},
                        ),
                        RestaurantCustomTab(
                          title: 'Favorites',
                          count: '50',
                          isActive: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  // List of Visited Restaurants
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 300,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const RestaurantCardWidget(
                                type: RestaurantCardType.visited);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
