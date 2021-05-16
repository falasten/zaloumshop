import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/constants.dart';
import 'package:zaloum_for_shopping/user/components/default_button.dart';
import 'package:zaloum_for_shopping/size_config.dart';
import 'package:zaloum_for_shopping/user/components/rounded_icon_btn.dart';
import 'package:zaloum_for_shopping/user/core/models/order_model.dart';
import 'package:zaloum_for_shopping/user/core/providers/order_provider.dart';
import 'package:zaloum_for_shopping/user/screens/home/home_screen.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Order order;

  const Body({Key key, @required this.order}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int count;
  double totalPrice, orderPrice;

  @override
  void initState() {
    count = widget.order.orderCount ?? '1';
    orderPrice = widget.order.productPrice / count;
    totalPrice = orderPrice * count;
    super.initState();
  }

  void onEditOrder(BuildContext context) {
    widget.order.productPrice = totalPrice;
    widget.order.orderCount = count;
    Provider.of<OrderProvider>(context, listen: false)
        .updateOrder(widget.order);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) =>
            route == MaterialPageRoute(builder: (context) => HomeScreen()));
    //Navigator.pop(context);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(order: widget.order),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(155),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Text(
                        widget.order.productTitle,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(15)),
                        width: getProportionateScreenWidth(64),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          // color: widget.order.isFavorite
                          //     ? Color(0xFFFFE6E6)
                          //     : Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: Color(0xFFDBDEE4),
                          // color: widget.product.isFavorite
                          //     ? Color(0xFFFF4848)
                          //     : Color(0xFFDBDEE4),
                          height: getProportionateScreenWidth(16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(20),
                        right: getProportionateScreenWidth(64),
                      ),
                      child: Text(
                        widget.order.productDesc,
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "$totalPrice",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor,
                                  fontSize: 15),
                            ),
                            SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Image.asset("assets/images/nis.png",
                                  height: 12, color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                //color: Colors.white,
                child: Column(
                  children: [
                    //ColorDots(product: widget.product),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconBtn(
                            icon: Icons.remove,
                            press: () {
                              setState(() {
                                count == 1 ? count = 1 : count--;
                                totalPrice = orderPrice * count;
                              });
                            },
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(40),
                            child: Center(child: Text('$count')),
                          ),
                          RoundedIconBtn(
                            icon: Icons.add,
                            showShadow: true,
                            press: () {
                              setState(() {
                                count++;
                                totalPrice = orderPrice * count;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(25),
                        ),
                        child: Column(
                          children: [
                            DefaultButton(
                              text: "Edit",
                              press: () {
                                onEditOrder(context);
                                setState(() {});
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DefaultButton(
                              text: "Delete",
                              press: () {
                                Provider.of<OrderProvider>(context,
                                        listen: false)
                                    .deleteOrder(widget.order);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => HomeScreen()),
                                // );
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                    (route) =>
                                        route ==
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
