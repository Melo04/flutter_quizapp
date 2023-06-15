import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../components/form/custom_form_submit_button.dart';
import '../components/form/custom_text_form_field.dart';
import '../controllers/signup_controller.dart';
import '../controllers/user_model.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final controller = Get.put(SignUpController());
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
                controller: controller.email,
                hintText: "Enter your email",
                labelText: "Email",
                obscureText: false,
                icon: Icons.email),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                controller: controller.username,
                hintText: "Enter your username",
                labelText: "Username",
                obscureText: false,
                icon: Icons.person),
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
            CustomTextFormField(
                controller: controller.phone,
                hintText: "Enter your phone number",
                labelText: "Phone Number",
                obscureText: false,
                icon: Icons.phone),
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
            const SizedBox(height: 50),
            CustomFormSubmitButton(
              buttonText: "Register",
              buttonAction: () {
                if (_formKey.currentState!.validate()) {
                  final user = UserModel(
                    email: controller.email.text.trim(),
                    userName: controller.username.text.trim(),
                    password: controller.password.text.trim(),
                    phoneNo: controller.phone.text.trim(),
                  );
                  SignUpController.instance.createUser(user);
                  SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
