import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // linear gradient background box height of 100
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF805CFF),
                    Color(0xFF5CC2E0),
                  ],
                ),
              ),
            ),
          ),

          // Custom App Bar Box with height of 100 and margin from right and left of 20 rounded corners of 20 with drawer icon on left
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            height: 82,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F8FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Drawer Icon
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF795CE0).withOpacity(0.8),
                              const Color(0xFF4E3AAD).withOpacity(0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0, 1],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF795CE0).withOpacity(0.4),
                              blurRadius: 8,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

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
                        color: Color(0xFF805FFE),
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

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Restaurant Image
          Container(
            width: 105,
            height: 105,
            margin: const EdgeInsets.only(left: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(17),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  blurRadius: 17,
                  offset: Offset(4, 8),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/google_logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Restaurant Details
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Restaurant Name
                  const Text(
                    'Restaurant Name',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Color(0xFF444444),
                    ),
                  ),
                  const SizedBox(height: 7),

                  // Address
                  const Text(
                    'Kuwait, Kuwait City',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 11,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                  SizedBox(height: 7),
                  // Status
                  const Text(
                    'Welcome now',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      color: Color(0xFF98e286),
                    ),
                  ),
                  const SizedBox(height: 3),
                  // Restaurant Rating
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color(0xFFFFC107),
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '4.9',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
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
