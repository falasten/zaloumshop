import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/repository/order_client.dart';
import 'package:zaloum_for_shopping/user/components/default_button.dart';
import 'package:zaloum_for_shopping/user/core/models/order_model.dart';
import 'package:zaloum_for_shopping/user/core/providers/order_provider.dart';
import '../../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, value, child) {
      return FutureBuilder<double>(
          future: value.getTotal(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                double totalPrice = snapshot.data;
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenWidth(15),
                    horizontal: getProportionateScreenWidth(30),
                  ),
                  // height: 174,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: getProportionateScreenHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Total:"),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Image.asset(
                                          "assets/images/nis.png",
                                          height: 12),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("$totalPrice",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(190),
                              child: DefaultButton(
                                text: "Check Out",
                                press: () async {
                                  List<Order> ordersFutureList =
                                      Provider.of<OrderProvider>(context,
                                              listen: false)
                                          .userOrders;
                                  ordersFutureList.forEach((order) {
                                    OrdersClient.ordersClient
                                        .addOneOrderToFirestore(order);
                                  });
                                  Provider.of<OrderProvider>(context,
                                          listen: false)
                                      .deleteAll();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
  }
}
