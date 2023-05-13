import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttergdsc/components/form/custom_text_form_field.dart';
import 'package:fluttergdsc/components/square_tile.dart';
import 'package:fluttergdsc/forms/register_form.dart';
import '../components/bottom_wording.dart';
import '../components/form/custom_form_submit_button.dart';
import '../components/logo_banner.dart';
import 'forgot_password_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                LogoBanner(icon: Icons.flutter_dash, title: "Flutter Bootcamp"),
                const SizedBox(height: 25),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        RegisterForm(),
                        const SizedBox(height: 50),
                        CustomFormSubmitButton(buttonText: "Register", buttonAction: () {}),
                        const SizedBox(
                          height: 30,
                        ),
                        BottomWording(
                          descriptionText: "Already Registered? ",
                          navigationText: "Login Now",
                          navigationAction: () {
                            Navigator.pushNamed(context, "/login");
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
