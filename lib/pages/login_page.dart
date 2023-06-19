import 'package:flutter/material.dart';
import 'package:fluttergdsc/components/bottom_wording.dart';
import 'package:fluttergdsc/forms/login_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String? name, imageUrl, userEmail, uid;
  //final controller = Get.put(LoginController());

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/bg3.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
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
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 10, top: 10),
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
                      // controller.isGoogleLoading.value = true;
                      // controller.googleSignIn();
                      signInWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: isHovered
                          ? Colors.blue.withOpacity(1.0)
                          : Colors.blue.withOpacity(0.2),
                      elevation:
                          isHovered ? 20 : 0, // Remove the button elevation
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
                            style: GoogleFonts.poppins(
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
      ),
    );
  }

  Future<User?> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    // The `GoogleAuthProvider` can only be
    // used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }

    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
      prefs.setString('name', name!);
      prefs.setString('email', userEmail!);
      prefs.setString('image', imageUrl!);
      print("name: $name");
      print("userEmail: $userEmail");
      print("imageUrl: $imageUrl");
    }
    return user;
  }
}
