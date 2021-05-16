import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/user/core/models/order_model.dart';
import 'package:zaloum_for_shopping/user/core/providers/order_provider.dart';

import '../../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
        builder: (context, OrderProvider value, child) {
      List<Order> orders = value.userOrders;
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CartCard(order: orders[index]),
          ),
        ),
      );
    });
  }
}
