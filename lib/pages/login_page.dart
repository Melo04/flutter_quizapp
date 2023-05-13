import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttergdsc/components/bottom_wording.dart';
import 'package:fluttergdsc/components/form/custom_form_submit_button.dart';
import 'package:fluttergdsc/components/form/custom_text_form_field.dart';
import 'package:fluttergdsc/components/square_tile.dart';
import 'package:fluttergdsc/forms/login_form.dart';
import 'package:fluttergdsc/pages/forgot_password_page.dart';
import 'package:fluttergdsc/pages/landing_page.dart';
import 'package:fluttergdsc/pages/register_page.dart';

import '../components/logo_banner.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            LogoBanner(icon: Icons.flutter_dash, title: "Flutter Bootcamp"),
            const SizedBox(height: 25),
            LoginForm(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(
                  imagePath: "assets/image/google.png",
                ),
                const SizedBox(
                  width: 25,
                ),
                SquareTile(
                  icon: Icons.apple,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
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
    );
  }
}
