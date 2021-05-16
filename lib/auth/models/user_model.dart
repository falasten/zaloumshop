import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String userId;
  String userName;
  String userEmail;
  String password;
  bool isAdmin;
  String imageUrl;
  String phone;
  String address;

   UserModel({this.userName,this.userEmail,this.isAdmin,
   this.password,this.imageUrl,this.phone,this.address});

  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.userId = documentSnapshot.documentID;
    this.userName = documentSnapshot.data['UserName'];
    this.userEmail = documentSnapshot.data['UserEmail'];
    this.isAdmin = documentSnapshot.data['IsAdmin'];
    this.password = documentSnapshot.data['Password'];
    this.imageUrl = documentSnapshot.data['imageUrl'];
    this.phone = documentSnapshot.data['phone'];
    this.address = documentSnapshot.data['address'];
  }
toJson(){
  return {
    'UserName': this.userName,
    'UserEmail': this.userEmail,
    'IsAdmin': this.isAdmin,
    'Password': this.password,
    'imageUrl':this.imageUrl,
    'phone':this.phone,
    'address':this.address,
  };
}
}

