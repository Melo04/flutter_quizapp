import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../controllers/user_model.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text("Update Profile",
            style: Theme.of(context).textTheme.headline6),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;

                  //Controllers
                  final email = TextEditingController(text:   userData.email);
                  final password = TextEditingController(text:  userData.password);
                  final userName = TextEditingController(text: userData.userName);
                  final phoneNo = TextEditingController(text: userData.phoneNo);

                  return Column(
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
                      const SizedBox(height: 50),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                                controller: userName,
                                decoration: InputDecoration(
                                  label: Text("Username"),
                                  prefixIcon: Icon(Icons.person),
                                )),
                            const SizedBox(height: 20),
                            TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                  label: Text("Email"),
                                  prefixIcon: Icon(Icons.email),
                                )),
                            const SizedBox(height: 20),
                            TextFormField(
                                controller: password,
                                decoration: InputDecoration(
                                  label: Text("Password"),
                                  prefixIcon: Icon(Icons.lock),
                                )),
                            const SizedBox(height: 20),
                            TextFormField(
                                controller: phoneNo,
                                decoration: InputDecoration(
                                  label: Text("Phone number"),
                                  prefixIcon: Icon(Icons.phone),
                                )),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                    final userData = UserModel (
                                      userName: userName.text.trim(),
                                      email: email.text.trim(),
                                      password: password.text.trim(),
                                      phoneNo: phoneNo.text.trim(),
                                    );
                                    await controller.updateRecord(userData);

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade800,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: Text("Update Profile",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
