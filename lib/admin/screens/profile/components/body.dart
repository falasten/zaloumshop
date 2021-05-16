import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/screens/add_category/add_categories_screen.dart';
import 'package:zaloum_for_shopping/admin/screens/home/home_screen.dart';
import 'package:zaloum_for_shopping/admin/screens/orders/orders_screen.dart';
import 'package:zaloum_for_shopping/auth/repository/auth_client.dart';
import 'package:zaloum_for_shopping/auth/sign_in/sign_in_screen.dart';
// import 'package:zaloum_for_shopping/admin/screens/add_products/add_products_screen.dart';
// import 'package:zaloum_for_shopping/admin/screens/complete_profile/complete_profile_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
              text: "Home",
              icon: "assets/icons/Shop Icon.svg",
              press: () {
                Navigator.pushNamed(context, AdminHomeScreen.routeName);
              }),
          ProfileMenu(
              text: "Category",
              icon: "assets/icons/Gift Icon.svg",
              press: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddCategoriesScreen()))),
          ProfileMenu(
            text: "Orders",
            icon: "assets/icons/Parcel.svg",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserOrdersScreen()));
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              FireAuthHelper.fireAuthHelper.signOutFromDevice();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                  (route) =>
                      route ==
                      MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          ),
        ],
      ),
    );
  }
}
