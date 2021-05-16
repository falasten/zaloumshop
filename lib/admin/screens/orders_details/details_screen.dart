import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/models/admin_order_model.dart';
import 'package:zaloum_for_shopping/auth/models/user_model.dart';
import 'package:zaloum_for_shopping/auth/providers/user_provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final AdminOrder adminOrder;
  DetailsScreen({this.adminOrder});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) {
      value.userId = adminOrder.userId;
      UserModel userModel = value.orderUser;
      return Column(
        children: [
          SizedBox(height: 10),
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CachedNetworkImage(
                    imageUrl: adminOrder.imageUrl, fit: BoxFit.contain),
              ),
            ),
          ),
          Text("${adminOrder.productTitle}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total Price: ${adminOrder.productPrice}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset("assets/images/nis.png",
                    height: 10, color: kPrimaryColor),
              ),
            ],
          ),
          Text("Quantity: x${adminOrder.orderCount}"),
          //SizedBox(height: 10),
          //ColorDots(product: product),
          SizedBox(height: 10),
          Text("Phone: ${userModel.phone}"),
          Text("Adress: ${userModel.address}"),
          SizedBox(height: 10),
        ],
      );
    });
  }
}
