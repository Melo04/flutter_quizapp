import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String email;
  final String userName;
  final String password;
  final String phoneNo;

  const UserModel({
    this.id,
    required this.email,
    required this.userName,
    required this.password,
    required this.phoneNo,
  });

  toJson(){
    return{
      "Email": email,
      "UserName": userName,
      "Password": password,
      "PhoneNo": phoneNo,
    };
  }

  // Map user fetched from firestore to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      userName: data["UserName"],
      password: data["Password"],
      phoneNo: data["PhoneNo"],
    );
  }
}