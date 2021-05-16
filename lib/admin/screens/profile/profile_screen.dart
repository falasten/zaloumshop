import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/components/coustom_bottom_nav_bar.dart';
import 'package:zaloum_for_shopping/admin/enums.dart';


import 'components/body.dart';

class AdminProfileScreen extends StatelessWidget {
  static String routeName = "/adminprofile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.adminprofile),
    );
  }
}
