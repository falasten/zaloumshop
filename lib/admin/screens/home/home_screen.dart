import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/components/coustom_bottom_nav_bar.dart';
import 'package:zaloum_for_shopping/admin/enums.dart';

import 'components/body.dart';

class AdminHomeScreen extends StatelessWidget {
  static String routeName = "/adminhome";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.adminhome),
    );
  }
}
