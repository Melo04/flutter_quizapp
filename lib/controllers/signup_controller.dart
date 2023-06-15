import 'package:flutter/material.dart';
import 'package:fluttergdsc/controllers/authentication_repo.dart';
import 'package:fluttergdsc/controllers/user_model.dart';
import 'package:fluttergdsc/controllers/user_repository.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(email, password);
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }
}