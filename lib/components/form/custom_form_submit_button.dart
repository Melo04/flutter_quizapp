import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormSubmitButton extends StatelessWidget {
  final String buttonText;
  final Function()? buttonAction;
  const CustomFormSubmitButton({super.key, this.buttonAction, required this.buttonText});

  @override
  Widget build(BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll<Color>(Colors.blue.shade700),
            textStyle: MaterialStatePropertyAll<TextStyle>(
              GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                wordSpacing: 5,
              ),
            ),
        ),
        onPressed: buttonAction,
        child: Text(buttonText),
      ),
    );
  }
}