import 'package:flutter/material.dart';
import 'package:fluttergdsc/controllers/login_controller.dart';
import 'package:get/get.dart';
import '../components/form/custom_form_submit_button.dart';
import '../components/form/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
                controller: controller.email,
                hintText: "Enter your email",
                labelText: "Email",
                obscureText: false,
                icon: Icons.mail),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                controller: controller.password,
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
            CustomFormSubmitButton(
                buttonText: "Login",
                buttonAction: () {
                  if (_formKey.currentState!.validate()) {
                    // AuthenticationRepository().loginWithEmailAndPassword(
                    //     emailController.text, passwordController.text);
                    LoginController.instance.loginUser(
                        controller.email.text, controller.password.text);
                  }
                })
          ],
        ),
      ),
    );
  }
}
