import 'package:flutter/material.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Test 1"),
        SizedBox(
          height: 10,
        ),
        Text("I am Currency Test"),
      ],
    );
  }
}
