import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttergdsc/firebase_options.dart';
import 'package:fluttergdsc/pages/forgot_password_page.dart';
import 'package:fluttergdsc/pages/home_page.dart';
import 'package:fluttergdsc/pages/login_page.dart';
import 'package:fluttergdsc/pages/register_page.dart';
import 'package:fluttergdsc/pages/weather_page.dart';
import 'package:get/get.dart';
import 'controllers/authentication_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((value) => Get.put(AuthenticationRepository()));
  WidgetsApp.debugAllowBannerOverride = false;
  
  runApp(GetMaterialApp(
    home: MyApp(),
    routes: {
      "/login": (context) => LoginPage(),
      "/register": (context) => RegisterPage(),
      "/forgot-password": (context) => ForgotPasswordPage(),
      "/weather":(context) => WeatherPage(),
      "/home": (context) => HomePage(),
    }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => LoginPage(),
        "/register": (BuildContext context) => RegisterPage(),
        "/forgot-password": (BuildContext context) => ForgotPasswordPage(),
        "/weather":(BuildContext context) => WeatherPage(),
        "/home": (BuildContext context) => HomePage(),
      }
    );
  }
}