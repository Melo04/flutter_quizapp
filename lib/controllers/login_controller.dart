import 'package:flutter/material.dart';
import 'package:fluttergdsc/controllers/authentication_repo.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  Future<void> loginUser() async {
    try{
      isLoading.value = true;
      if(!loginFormKey.currentState!.validate()){
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser.value);
    }catch(e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<void> googleSignIn() async {
    try{
      isGoogleLoading.value = true;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleLoading.value = false;
    }catch(e) {
      isGoogleLoading.value = false;
      rethrow;
    }
  }
}