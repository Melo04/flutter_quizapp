import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import '../components/form/custom_form_submit_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              height: 200,
              width: 200,
              child: Text(
                "Welcome to Flutter Bootcamp :)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 50,
              child: CustomFormSubmitButton(
                buttonText: "Log Out",
                buttonAction: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Logout Success"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ),
          ],
        ),
      ),);
  }
}
