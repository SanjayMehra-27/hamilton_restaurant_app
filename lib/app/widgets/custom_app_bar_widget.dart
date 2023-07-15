import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:restaurant_app/app/modules/home/controllers/home_controller.dart';

class CustomAppBar extends GetView<HomeController> {
  const CustomAppBar({
    Key? key,
    this.showSettingsIcon = false,
  }) : super(key: key);

  final bool? showSettingsIcon;
  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            Padding(
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
                child: Column(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            if (showSettingsIcon == true)
              // Settings Icon
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF5CC2E0).withOpacity(0.8),
                        const Color(0xFF805CFF).withOpacity(0.8),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: const [0, 1],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5CC2E0).withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 5,
                      ),
                      BoxShadow(
                        color: const Color(0xFF805CFF).withOpacity(0.4),
                        blurRadius: 5,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
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
