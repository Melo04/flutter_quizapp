import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttergdsc/components/form/custom_form_submit_button.dart';
import 'package:fluttergdsc/components/form/custom_text_form_field.dart';
import 'package:fluttergdsc/components/square_tile.dart';
import 'package:fluttergdsc/forms/forgot_password_form.dart';
import 'package:fluttergdsc/pages/register_page.dart';

import '../components/bottom_wording.dart';
import '../components/logo_banner.dart';

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
                SizedBox(
                  height: 50,
                ),
                LogoBanner(icon: Icons.lock_reset, title: "Reset Password"),
                SizedBox(
                  height: 25,
                ),
                ForgotPasswordForm(),
                SizedBox(
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
