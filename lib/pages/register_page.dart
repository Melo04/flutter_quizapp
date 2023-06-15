import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttergdsc/forms/register_form.dart';
import '../components/bottom_wording.dart';

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
                const Column(children: [
                  Icon(Icons.flutter_dash, size: 120),
                  SizedBox(height: 20),
                  Text(
                    "Flutter Quiz & Weather App",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
                const SizedBox(height: 25),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        RegisterForm(),
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
