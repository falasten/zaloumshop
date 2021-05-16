import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String documentId;
  String title;
  double price;
  String imageUrl;
  String category;
  String description;
  bool isFavorite;
  

  Product(
      {
      this.documentId,
      this.title,
      this.price,
      this.description,
      this.category,
      this.imageUrl,
      this.isFavorite = false,
      
      });
  
  changeFavoriteStatus() {
    isFavorite = !isFavorite;
  } 
  Product.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.documentId = documentSnapshot.documentID;
    this.title = documentSnapshot.data['title'];
    this.price = documentSnapshot.data['price'];
    this.imageUrl = documentSnapshot.data['imageUrl'];
    this.isFavorite = documentSnapshot.data['isFavorite'];
    this.category = documentSnapshot.data['category'];
    this.description = documentSnapshot.data['description'];
    
  }
  toJson() {
    return {
      'title': this.title,
      'price': this.price,
      'imageUrl': this.imageUrl,
      'isFavorite': this.isFavorite,
      'description': this.description,
      'category': this.category,
      
      
    };
  }
}
