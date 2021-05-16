import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/screens/edit_products/components/product_form.dart';
import 'package:zaloum_for_shopping/admin/screens/edit_products/components/product_pic.dart';
import 'package:zaloum_for_shopping/size_config.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';

class Body extends StatelessWidget {
  final Product product;
  Body({this.product});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: SizeConfig.screenWidth * 0.07, 
        right: SizeConfig.screenWidth * 0.07,
        top: SizeConfig.screenHeight * 0.06,
        ),
      child: Column(
        children: [
          Center(child: ProfilePic(product: product,)),
          SizedBox(height: 20),
          EditProductsForm(product: product,)
        ],
      ),
    );
  }
}
