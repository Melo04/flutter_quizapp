import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.nunito(color: Colors.grey.shade900, fontSize: 16),
        ),
        GestureDetector(
          child: Text(
            navigationText,
            style: GoogleFonts.nunito(
                color: Colors.blue.shade900, fontWeight: FontWeight.w800, fontSize: 16),
          ),
          onTap: navigationAction,
        ),
      ],
    );
  }
}