import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
              child: Row(
                // scrollDirection: Axis.horizontal,
                children: [
                  // Dine In Tab
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 126,
                      height: 45,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF805FFE),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05),
                            blurRadius: 8,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Dine In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Pick Up Tab
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 126,
                      height: 45,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05),
                            blurRadius: 8,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Pick Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Scrollable List of Restaurants with image, name, rating, and price range & status(Were Open, Closed)
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: const [
                  // Restaurant Card
                  RestaurantCardWidget(),
                  RestaurantCardWidget(),
                  RestaurantCardWidget(),
                  RestaurantCardWidget(),
                  RestaurantCardWidget(),
                  RestaurantCardWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
