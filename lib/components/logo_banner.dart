import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LogoBanner extends StatelessWidget {
  final IconData icon;
  final String title;
  const LogoBanner({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(icon, size: 120),
      SizedBox(height: 20),
      Text(
        title,
        style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      )
    ]);
  }
}
