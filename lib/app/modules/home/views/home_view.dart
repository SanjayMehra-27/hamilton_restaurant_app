import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/app/data/enums/app_anums.dart';
import '../../../widgets/app_drawer.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../../../widgets/restaurant_card_widget.dart';
import '../../../widgets/status_bar_linear_background_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      drawerScrimColor: Colors.transparent,
      drawerEdgeDragWidth: 0,
      body: Stack(
        children: [
          // linear gradient background box height of 100
          const StatusBarLinearBackgroundWidget(),

          // Custom App Bar Box height of 82
          const CustomAppBar(),

          // Two Tabs [Dine In, Pick Up] with filled primary color and white text
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            height: 50,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Obx(() => Row(
                    // scrollDirection: Axis.horizontal,
                    children: [
                      // Dine In Tab
                      RestaurantTabWidget(
                        text: 'Dine In',
                        isSelected:
                            controller.selectedRestaurantType.value == 1,
                        onTap: () {
                          controller.getRestaurants();
                          controller.selectedRestaurantType.value = 1;
                        },
                      ),

                      // Pick Up Tab
                      RestaurantTabWidget(
                        text: 'Pick Up',
                        isSelected:
                            controller.selectedRestaurantType.value == 0,
                        onTap: () {
                          controller.getRestaurants();
                          controller.selectedRestaurantType.value = 0;
                        },
                      ),
                    ],
                  )),
            ),
          ),

          // Scrollable List of Restaurants with image, name, rating, and price range & status(Were Open, Closed)
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Obx(() => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF805FFE),
                          ),
                        )
                      : controller.restaurants.length == 0
                          ? const Center(
                              child: Text(
                                'No Restaurants Found',
                                style: TextStyle(
                                  color: Color(0xFF805FFE),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : RefreshIndicator(
                              backgroundColor: Colors.white,
                              color: const Color(0xFF805FFE),
                              onRefresh: () async {
                                controller.getRestaurants();
                              },
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return RestaurantCardWidget(
                                    restaurant: controller.restaurants[index],
                                  );
                                },
                                itemCount: controller.restaurants.length,
                              ),
                            ),
                )),
          ),
        ],
      ),
    );
  }
}

class RestaurantTabWidget extends StatelessWidget {
  const RestaurantTabWidget({
    Key? key,
    this.isSelected = false,
    this.onTap,
    required this.text,
  }) : super(key: key);
  final bool? isSelected;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: 126,
        height: 45,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: isSelected == true ? const Color(0xFF805FFE) : Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 8,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: isSelected == true
                ? const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
                : const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
          ),
        ),
      ),
    );
  }
}
