

import 'package:zaloum_for_shopping/user/core/database/dbhelper.dart';

class Order{
  int orderId;
  String productId;
  int orderCount;
  String userId;
  String imageUrl;
  double productPrice;
  String productTitle;
  String productDesc;
DateTime timeNow = DateTime.now();
   Order({this.productId,this.orderCount,this.userId,
   this.imageUrl,this.productPrice,this.productTitle,this.productDesc, this.timeNow});

Order.fromJson(Map<String,dynamic> map){
    this.orderId=map[DBHelper.orderIdColumn];
    this.productId=map[DBHelper.productIdColumn];
    this.orderCount=map[DBHelper.orderCountColumn];
    this.userId=map[DBHelper.orderUserIdColumn];
    this.productTitle=map[DBHelper.orderProductTitleColumn];
    this.productPrice=map[DBHelper.orderProductPriceColumn];
    this.imageUrl=map[DBHelper.orderProductImageUrlColumn];
    this.productDesc=map[DBHelper.orderProductDescColumn];
    this.timeNow=map[DBHelper.orderProducttimeNow];
  }

toJson(){
  return {
    DBHelper.productIdColumn: this.productId,
    DBHelper.orderCountColumn: this.orderCount,
    DBHelper.orderUserIdColumn: this.userId,
    DBHelper.orderProductTitleColumn: this.productTitle,
    DBHelper.orderProductPriceColumn: this.productPrice,
    DBHelper.orderProductImageUrlColumn: this.imageUrl,
    DBHelper.orderProductDescColumn: this.productDesc,
    DBHelper.orderProducttimeNow: this.timeNow
  };
}


}

