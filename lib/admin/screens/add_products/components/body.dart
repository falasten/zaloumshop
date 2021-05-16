import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/screens/add_products/components/product_form.dart';
import 'package:zaloum_for_shopping/admin/screens/add_products/components/product_pic.dart';
import 'package:zaloum_for_shopping/size_config.dart';
// import 'package:shop_app/screens/add_products/add_products_screen.dart';
// import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';

// import 'product_form.dart';


class Body extends StatelessWidget {
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
          Center(child: ProfilePic()),
          SizedBox(height: 20),
          AddProductsForm()
        ],
      ),
    );
  }
}
