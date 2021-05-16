import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/user/screens/home/components/categories.dart';
import 'package:zaloum_for_shopping/user/screens/home/components/special_offers.dart';

import '../../../../size_config.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(10)),
          SpecialOffers(),
          SizedBox(height: getProportionateScreenWidth(10)),
          Categories(),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(10)),
        ],
      ),
    );
  }
}
