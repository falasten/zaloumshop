import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/models/admin_order_model.dart';
import 'package:zaloum_for_shopping/admin/core/providers/order_admin_provider.dart';
import 'package:zaloum_for_shopping/user/screens/orders/components/check_out_card.dart';
import 'package:zaloum_for_shopping/user/screens/orders/components/orders_card.dart';

import '../../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          CheckoutCard(),
          Expanded(
            child: Consumer<AdminOrderProvider>(
                builder: (context, AdminOrderProvider value, child) {
              List<AdminOrder> orders = value.myOrder;
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: OrdersCard(adminOrder: orders[index]),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
