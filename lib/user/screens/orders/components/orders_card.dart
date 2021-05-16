import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/core/models/admin_order_model.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({
    Key key,
    @required this.adminOrder,
  }) : super(key: key);

  final AdminOrder adminOrder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedNetworkImage(imageUrl: adminOrder.imageUrl,fit: BoxFit.contain)
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: Text(
                "${adminOrder.productTitle}",
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Image.asset("assets/images/nis.png",
                      height: 10, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Text(
                  "${adminOrder.productPrice}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Text("x${adminOrder.orderCount}",
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ],
        )
      ],
    );
  }
}
