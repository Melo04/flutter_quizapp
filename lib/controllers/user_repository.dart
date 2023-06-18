import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttergdsc/controllers/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //1. Store user details in firestore
  createUser(UserModel user) async{
    await _db.collection("Users").add(user.toJson()).whenComplete(
            () => Get.snackbar("Success", "User created successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green
            )
    ).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Please Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red
      );
    });
  }

  //2. Get user details from firestore
  Future<UserModel> getUserDetails(String email) async {
      final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
      final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
      return userData;
  }
}