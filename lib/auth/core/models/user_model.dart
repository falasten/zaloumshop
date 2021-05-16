// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel{
//   String userId;
//   String userName;
//   String userEmail;
//   String password;
//   bool isAdmin;
//   String imageUrl;
//   String country;
//   String city;
//   String region;

//    UserModel({this.userName,this.userEmail,this.isAdmin,
//    this.password,this.imageUrl,this.country,this.city,this.region});

//   UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
//     this.userId = documentSnapshot.documentID;
//     this.userName = documentSnapshot.data['UserName'];
//     this.userEmail = documentSnapshot.data['UserEmail'];
//     this.isAdmin = documentSnapshot.data['IsAdmin'];
//     this.password = documentSnapshot.data['Password'];
//     this.imageUrl = documentSnapshot.data['imageUrl'];
//     this.country = documentSnapshot.data['country'];
//     this.city = documentSnapshot.data['city'];
//     this.region = documentSnapshot.data['region'];
//   }
// toJson(){
//   return {
//     'UserName': this.userName,
//     'UserEmail': this.userEmail,
//     'IsAdmin': this.isAdmin,
//     'Password': this.password,
//     'imageUrl':this.imageUrl,
//     'country':this.country,
//     'city':this.city,
//     'region':this.region,
//   };
// }
// }

