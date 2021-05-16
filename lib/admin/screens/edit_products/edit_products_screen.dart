import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';
import 'package:zaloum_for_shopping/admin/screens/edit_products/components/body.dart';
// import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
// import 'package:shop_app/enums.dart';

//import 'components/body.dart';

class EditProductsScreen extends StatelessWidget {
  static String routeName = "/editproduct";
  final Product product;
  EditProductsScreen({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit product"),
      ),
      body: Body(product: product,),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
