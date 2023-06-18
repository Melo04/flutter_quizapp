import 'package:cloud_firestore/cloud_firestore.dart';
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

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<void> updateRecord(UserModel user) async {
    try {
      final firestore = FirebaseFirestore.instance;
      await firestore.collection('Users').doc(user.id).set(user.toJson(), SetOptions(merge: true));
      print('Profile updated successfully!');
    } catch (error) {
      print('Error updating profile: $error');
    }
  }

}