
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:zaloum_for_shopping/auth/core/auth_client.dart';
// import 'package:zaloum_for_shopping/auth/core/models/user_model.dart';
// class UserProvider extends ChangeNotifier {
// UserModel userModel;
// List<UserModel> users=[];

// get currentUser{
//     getCurrentUser();
//     return userModel;
//   }

// get allUsers{
//     getAllUsers();
//     return users;
//   }
// insertNewUser(UserModel userModel) async {
//     await FireAuthHelper.fireAuthHelper.addOneUserToFirestore(userModel);
//     notifyListeners();
//   }

// getAllUsers() async {
//     users = await FireAuthHelper.fireAuthHelper.getAllUsers();
//     notifyListeners();
//   }

// updateUser(UserModel userModel) async {
//     await FireAuthHelper.fireAuthHelper.updateProfile(userModel);
//     getCurrentUser();
//     notifyListeners();
//   }

// Future<UserModel>getCurrentUser()async{
//   userModel = await FireAuthHelper.fireAuthHelper.getCurrentUser();
//   notifyListeners();
// }

// uploadImage(File file) async {
//     await FireAuthHelper.fireAuthHelper.updateImage(file);
//     notifyListeners();
//   }

//   updateImage(File file) async {
//     await FireAuthHelper.fireAuthHelper.updateImage(file);
//     notifyListeners();
//   }
  
  
// }

