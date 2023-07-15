import 'package:flutter/material.dart';

import '../data/enums/app_anums.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    Key? key,
    this.type = RestaurantCardType.dinein,
  }) : super(key: key);
  final RestaurantCardType? type;
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

                  if (type == RestaurantCardType.visited)
                    // Date
                    const Text(
                      '40 time',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Color(0xFF5CC2E0),
                      ),
                    ),

                  if (type == RestaurantCardType.dinein)
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
                  if (type == RestaurantCardType.dinein)
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
                  if (type == RestaurantCardType.dinein)
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
