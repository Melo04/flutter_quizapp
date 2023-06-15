import 'package:flutter/material.dart';
import 'package:fluttergdsc/components/bottom_wording.dart';
import 'package:fluttergdsc/forms/login_form.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(LoginController());
  
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
              child: MouseRegion(
                onHover: (event) {
                  setState(() {
                    isHovered = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    isHovered = false;
                  });
                },
                child: ElevatedButton(
                  onPressed: () {
                    controller.googleSignIn();
                  },
                   style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: isHovered ? Colors.blue.withOpacity(1.0) : Colors.blue.withOpacity(0.2),
                    elevation: isHovered ? 20 : 0, // Remove the button elevation
                    padding: EdgeInsets.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/image/google.png"),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Sign in with Google",
                          style:  GoogleFonts.poppins(
                            color: isHovered ? Colors.white : Colors.blue,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
