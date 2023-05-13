import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttergdsc/pages/forgot_password_page.dart';

import '../components/form/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
                      ],
                    ),
                  ),
                );
  }
}