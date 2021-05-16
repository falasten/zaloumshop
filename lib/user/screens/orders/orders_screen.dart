import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/user/components/coustom_bottom_nav_bar.dart';
import 'package:zaloum_for_shopping/enums.dart';

import 'components/body.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = "/orders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
    );
  }
}
