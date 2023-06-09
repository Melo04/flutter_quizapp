import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = false,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue.withOpacity(0.1),
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title,
            style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: textColor ?? Colors.black
            )),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue.withOpacity(0.5),
                ),
                child: Center(
                  
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_back_ios,
                        size: 18.0, color: Colors.white),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
