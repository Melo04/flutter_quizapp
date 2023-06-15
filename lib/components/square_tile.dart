import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SquareTile extends StatelessWidget {
  final String? imagePath;
  final IconData? icon;
  final bool isLoading;
  final VoidCallback onPressed;

  const SquareTile({super.key, this.imagePath = "", this.icon, this.isLoading = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
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
      ),
    );
  }
}
