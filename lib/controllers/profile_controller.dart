import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttergdsc/controllers/user_model.dart';
import 'package:get/get.dart';
import 'authentication_repo.dart';
import 'user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  final email = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  final phoneNo = TextEditingController();
  late User firebaseUser;

  Future<UserModel> getUserData() async{
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser != null){
      final email = firebaseUser.email;
      if(email != null){
        UserModel user = await _userRepo.getUserDetails(email);
        return user;
      }else{
        Get.snackbar("Error", "Login to continue");
        throw Exception("Login to continue");
      }
    } else {
      Get.snackbar("Error", "User not found");
      throw Exception("User not found");
    }
  }
}