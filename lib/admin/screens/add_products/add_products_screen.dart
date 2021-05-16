import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/screens/add_products/components/body.dart';
// import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
// import 'package:shop_app/enums.dart';

//import 'components/body.dart';

class AddProductsScreen extends StatelessWidget {
  static String routeName = "/addproduct";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add product"),
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
