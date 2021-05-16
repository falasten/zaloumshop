import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/user/components/coustom_bottom_nav_bar.dart';
import 'package:zaloum_for_shopping/enums.dart';

import 'components/body.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
