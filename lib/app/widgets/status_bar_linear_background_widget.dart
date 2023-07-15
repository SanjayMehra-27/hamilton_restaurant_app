import 'package:flutter/material.dart';

class StatusBarLinearBackgroundWidget extends StatelessWidget {
  const StatusBarLinearBackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
