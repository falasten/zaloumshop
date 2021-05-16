import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/providers/order_admin_provider.dart';
import '../../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminOrderProvider>(builder: (context, value, child) {
      double totalPrice = value.myPrice??0;
      
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total:  "),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Image.asset("assets/images/nis.png",
                  height: 13, color: Colors.black),
            ),
            SizedBox(width: 5),
            Text(
              "$totalPrice",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        )),
      );
    });
  }
}
