import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/user/core/models/order_model.dart';
import 'package:zaloum_for_shopping/user/screens/edit_details/details_screen.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key key,
    this.order,
  }) : super(key: key);

  final Order order;

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => EditDetailsScreen(order: widget.order,)));
        
      },
          child: Row(
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
                    child: CachedNetworkImage(
                        imageUrl: widget.order.imageUrl, fit: BoxFit.contain, height: 12),
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
                      widget.order.productTitle,
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
                            height: 12, color: kPrimaryColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${widget.order.productPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("x${widget.order.orderCount}",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ],
              )
            ],
          ),
    );
  }
}
