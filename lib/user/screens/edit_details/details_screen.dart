import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/user/core/models/order_model.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class EditDetailsScreen extends StatelessWidget {
  static String routeName = "/editdetails";
  final Order order;

  EditDetailsScreen({this.order});

  @override
  Widget build(BuildContext context) {
    // final ProductDetailsArguments agrs =
    //     ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(),
      body: Body(order: order),
    );
  }
}

class ProductDetailsArguments {
  final Order order;

  ProductDetailsArguments({@required this.order});
}
