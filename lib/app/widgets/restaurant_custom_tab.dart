import 'package:flutter/material.dart';

class RestaurantCustomTab extends StatelessWidget {
  const RestaurantCustomTab({
    Key? key,
    required this.title,
    required this.count,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String count;
  final bool? isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 132,
        height: 37,
        margin: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          color: isActive == true ? const Color(0xFF805FFE) : Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 8,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: isActive == true
                            ? Colors.white
                            : const Color(0xFF343d45),
                      ),
                    ),
                    TextSpan(
                      text: '  $count',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: isActive == true
                            ? Colors.white
                            : const Color(0xFF343d45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
