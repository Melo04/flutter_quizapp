import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SquareTile extends StatelessWidget {
  final String? imagePath;
  final IconData? icon;

  const SquareTile({super.key, this.imagePath = "", this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(16),
      ),
      child: (imagePath == null || imagePath == "")
          ? Icon(
              icon!,
              size: 35,
            )
          : Image.asset(
              imagePath!,
              height: 35,
            ),
    );
  }
}
