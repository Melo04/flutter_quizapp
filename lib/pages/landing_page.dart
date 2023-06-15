import 'package:flutter/material.dart';
import 'package:fluttergdsc/controllers/authentication_repo.dart';
import 'package:fluttergdsc/pages/update_page.dart';
import 'package:get/get.dart';
import '../components/form/custom_form_submit_button.dart';
import '../components/profile_menu.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                              image: AssetImage("assets/image/people.png"),
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
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("Profile", style: Theme.of(context).textTheme.headline4),
                    Text("1234@gmail.com", style: Theme.of(context).textTheme.subtitle1),  
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => UpdateProfilePage()),
                        child: Text("Update Profile", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 20),
                          shape: const StadiumBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),

                    ProfileMenuWidget(title: "Settings", icon: Icons.settings, onPress: () {}, endIcon: true),
                    ProfileMenuWidget(title: "Help", icon: Icons.help, onPress: () {}, endIcon: true),
                    ProfileMenuWidget(title: "Notifications", icon: Icons.notifications, onPress: () {}, endIcon: true),
                    ProfileMenuWidget(title: "Privacy & Policy", icon: Icons.privacy_tip, onPress: () {}, endIcon: true),
                    ProfileMenuWidget(title: "Logout", icon: Icons.logout, textColor: Colors.red, endIcon: false, onPress: () {}),

                    CustomFormSubmitButton(
                      buttonText: "Log Out",
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
                  ],
                )),
          ],
        ),
      ),
    );
  }
}