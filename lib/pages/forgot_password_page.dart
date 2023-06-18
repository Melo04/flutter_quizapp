import 'package:flutter/material.dart';
import 'package:fluttergdsc/forms/forgot_password_form.dart';
import '../components/bottom_wording.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Column(children: [
                  Icon(Icons.lock_reset, size: 120),
                  SizedBox(height: 20),
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                const SizedBox(
                  height: 25,
                ),
                ForgotPasswordForm(),
                const SizedBox(
                  height: 50,
                ),
                BottomWording(
                  descriptionText: "Don't have an account? ",
                  navigationText: "Register Now",
                  navigationAction: () {
                    Navigator.pushNamed(context, "/register");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
