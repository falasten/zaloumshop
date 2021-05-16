import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  String documentId;
  String title;
  bool isActive;
  

  Category(
      {
      this.documentId,
      this.title,
      this.isActive=true,
      });
  
  
  Category.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.documentId = documentSnapshot.documentID;
    this.title = documentSnapshot.data['title'];
    this.isActive = documentSnapshot.data['isActive'];
  }
  toJson() {
    return {
      'title': this.title,
      'isActive': this.isActive,
    };
  }
}
