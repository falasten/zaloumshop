
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/auth/repository/auth_client.dart';
import 'package:zaloum_for_shopping/auth/models/user_model.dart';
class UserProvider extends ChangeNotifier {
UserModel userModel;
UserModel getUserModel;
String isDone;
List<UserModel> users=[];
String userId;

get currentUser{
    getCurrentUser();
    return userModel;
  }

get orderUser{
    getUser(userId);
    return getUserModel;
  }


get allUsers{
    getAllUsers();
    return users;
  }

get isRegisterDone{
    checkRegister();
    return isDone;
}
insertNewUser(UserModel userModel) async {
    await FireAuthHelper.fireAuthHelper.addOneUserToFirestore(userModel);
    notifyListeners();
  }

getAllUsers() async {
    users = await FireAuthHelper.fireAuthHelper.getAllUsers();
    notifyListeners();
  }

updateUser(UserModel userModel) async {
    await FireAuthHelper.fireAuthHelper.updateProfile(userModel);
    getCurrentUser();
    notifyListeners();
  }

 Future<String>checkRegister() async {
    isDone = await FireAuthHelper.fireAuthHelper.checkRegister();
    notifyListeners();
  }

Future<UserModel>getCurrentUser()async{
  userModel = await FireAuthHelper.fireAuthHelper.getCurrentUser();
  notifyListeners();
}

Future<UserModel>getUser(String userId)async{
  getUserModel = await FireAuthHelper.fireAuthHelper.getUser(userId);
  notifyListeners();
  print(getUserModel.userEmail);
  //return getUserModel;
}

uploadImage(File file) async {
    await FireAuthHelper.fireAuthHelper.updateImage(file);
    notifyListeners();
  }

  updateImage(File file) async {
    await FireAuthHelper.fireAuthHelper.updateImage(file);
    notifyListeners();
  }
  
  
}

