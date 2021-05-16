import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/core/models/admin_order_model.dart';

import '../../constants.dart';
import '../../size_config.dart';

class SpecialCard extends StatelessWidget {
  const SpecialCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.order,
  }) : super(key: key);

  final double width, aspectRetio;
  final AdminOrder order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: order.orderId,
                    child: CachedNetworkImage(imageUrl: order.imageUrl),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${order.productTitle}",
                style: TextStyle(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
