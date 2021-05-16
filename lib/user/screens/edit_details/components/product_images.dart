import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/user/core/models/order_model.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Order order;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  //int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.order.orderId.toString(),
              child: widget.order.imageUrl != null ?
                              CachedNetworkImage(imageUrl: widget.order.imageUrl,fit: BoxFit.contain) : Container(),
              //child: Image.asset(widget.product.imageUrl),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        //setState(() {
          //selectedImage = index;
        //});
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(1)),
        ),
        child: Image.asset(widget.order.imageUrl),
      ),
    );
  }
}
