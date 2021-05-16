import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/auth/repository/auth_client.dart';
import 'package:zaloum_for_shopping/auth/sign_in/sign_in_screen.dart';
import 'package:zaloum_for_shopping/user/screens/cart/cart_screen.dart';
import 'package:zaloum_for_shopping/user/screens/edit_profile/edit_profile_screen.dart';
import 'package:zaloum_for_shopping/user/screens/home/home_screen.dart';
import 'package:zaloum_for_shopping/user/screens/orders/orders_screen.dart';

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
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () =>
                Navigator.pushNamed(context, EditProfileScreen.routeName),
          ),
          ProfileMenu(
              text: "Home",
              icon: "assets/icons/Shop Icon.svg",
              press: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }),
          ProfileMenu(
            text: "Cart",
            icon: "assets/icons/Cart Icon.svg",
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Order",
            icon: "assets/icons/Parcel.svg",
            press: () {
              Navigator.pushNamed(context, OrdersScreen.routeName);
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
