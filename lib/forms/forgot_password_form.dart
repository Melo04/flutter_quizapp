import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/form/custom_form_submit_button.dart';
import '../components/form/custom_text_form_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController usernameController = TextEditingController();
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
                hintText: "Enter your existing username",
                labelText: "Username",
                obscureText: false,
                icon: Icons.person),
            const SizedBox(
              height: 50,
            ),
          CustomFormSubmitButton(buttonText: "Reset Password", buttonAction: () {})
          ],
        ),
      ),
  );          
  }
}