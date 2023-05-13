import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/bottom_wording.dart';
import '../components/form/custom_form_submit_button.dart';
import '../components/form/custom_text_form_field.dart';
import '../components/square_tile.dart';
import '../pages/forgot_password_page.dart';
import '../pages/landing_page.dart';
import '../pages/register_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                        controller: usernameController,
                        hintText: "Enter your username",
                        labelText: "Username",
                        obscureText: false,
                        icon: Icons.person),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        controller: passwordController,
                        hintText: "Enter your password",
                        labelText: "Password",
                        obscureText: true,
                        icon: Icons.lock),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              child: Text("Forgot Password?",
                                  style: TextStyle(color: Colors.grey)),
                              onTap: () {
                                Navigator.pushNamed(context, "/forgot-password");
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomFormSubmitButton(buttonText: "Login", buttonAction: () {
                      if (_formKey.currentState!.validate()) {
                        if(usernameController.text == "admin" && passwordController.text == "admin456"){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login Success"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushNamed(context, "/home");
                          ;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Wrong Credential, Please Try Again"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    })],
                ),
              ),
            );
  }
}