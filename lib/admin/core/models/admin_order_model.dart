import 'package:cloud_firestore/cloud_firestore.dart';

class AdminOrder{
  String orderId;
  String productId;
  int orderCount;
  String userId;
  String imageUrl;
  double productPrice;
  String productTitle;
  String productDescription;
  DateTime timeNow = DateTime.now();

   AdminOrder({this.productId,this.orderCount,this.userId,
   this.productPrice,this.imageUrl,this.productTitle,this.productDescription});

  AdminOrder.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    this.orderId = documentSnapshot.documentID;
    this.orderCount = documentSnapshot.data['OrderCount'];
    this.productId = documentSnapshot.data['ProductId'];
    this.userId = documentSnapshot.data['OrderUserId'];
    this.productTitle = documentSnapshot.data['OrderProductTitle'];
    this.productPrice = documentSnapshot.data['OrderProductPrice'];
    this.imageUrl = documentSnapshot.data['OrderProductImageUrl'];
    this.productDescription = documentSnapshot.data['OrderProductDescription'];
    this.timeNow = documentSnapshot.data['OrderProducttimeNow'];
  }
toJson(){
  return {
    'ProductId': this.productId,
    'OrderCount': this.orderCount,
    'OrderUserId': this.userId,
    'OrderProductTitle': this.productTitle,
    'OrderProductPrice': this.productPrice,
    'OrderProductImageUrl': this.imageUrl,
    'OrderProductDescription':this.productDescription,
    'OrderProducttimeNow':this.timeNow
  };
}


}

