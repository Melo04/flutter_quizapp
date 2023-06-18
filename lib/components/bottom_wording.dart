import 'package:flutter/material.dart';

class BottomWording extends StatelessWidget {
  final String descriptionText;
  final String navigationText;
  final Function()? navigationAction;
  const BottomWording({super.key, required this.descriptionText, required this.navigationText, this.navigationAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          descriptionText,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        GestureDetector(
          child: Text(
            navigationText,
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          onTap: navigationAction,
        ),
      ],
    );
  }
}