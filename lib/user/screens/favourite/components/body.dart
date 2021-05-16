import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/user/screens/favourite/components/popular_product.dart';

import '../../../../size_config.dart';
// import 'home_header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          //HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(10)),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(10)),
        ],
      ),
    );
  }
}
