import 'package:flutter/material.dart';
import 'package:fluttergdsc/controllers/authentication_repo.dart';
import 'package:fluttergdsc/pages/weather_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/form/custom_form_submit_button.dart';
import '../components/profile_menu.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? name;
  String? email;
  String? image;

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  Future<void> getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    email = prefs.getString('email');
    image = prefs.getString('image');
    setState(() {}); // Update the widget with the retrieved value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/bg7.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: image != null
                                  ? Image.network(image!) 
                                  : Image.asset("assets/image/people.png"), 
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 3,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue.shade100,
                          ),
                          child: Icon(Icons.edit,
                              size: 20.0, color: Colors.blue.shade900),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(name ?? '',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        )), //name
                    Text(email ?? '',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )), //email
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        //navigate to weather page
                        onPressed: () => Get.to(() => WeatherPage() ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "View Live Weather",
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.hovered)
                                ? Colors.white.withOpacity(0.8)
                                : Colors.blue,
                          ),
                          foregroundColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.hovered)
                                ? Colors.blue
                                : Colors.white,
                          ),
                          textStyle: MaterialStateProperty.all(
                            GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(
                                  0, 3), // controls the position of the shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ProfileMenuWidget(
                                title: "Settings",
                                icon: Icons.settings,
                                onPress: () {},
                                endIcon: true),
                            ProfileMenuWidget(
                                title: "Help",
                                icon: Icons.help,
                                onPress: () {},
                                endIcon: true),
                            ProfileMenuWidget(
                                title: "Notifications",
                                icon: Icons.notifications,
                                onPress: () {},
                                endIcon: true),
                            ProfileMenuWidget(
                                title: "Privacy & Policy",
                                icon: Icons.privacy_tip,
                                onPress: () {},
                                endIcon: true),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomFormSubmitButton(
                        buttonText: "Logout",
                        buttonAction: () {
                          AuthenticationRepository().logout();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Logout Success"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushNamed(context, "/login");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
