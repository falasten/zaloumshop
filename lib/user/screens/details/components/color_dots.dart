// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';
// import 'package:zaloum_for_shopping/user/components/rounded_icon_btn.dart';
// import 'package:zaloum_for_shopping/user/core/providers/order_provider.dart';


// import '../../../../constants.dart';
// import '../../../../size_config.dart';

// class ColorDots extends StatefulWidget {
//   const ColorDots({
//     Key key,
//     @required this.product,
//   }) : super(key: key);

//   final Product product;

//   @override
//   _ColorDotsState createState() => _ColorDotsState();
// }

// class _ColorDotsState extends State<ColorDots> {
//   int count = 1;
//   double totalPrice;

// // @override
// //   void initState() {
// //     totalPrice=widget.product.price;
// //     super.initState();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     OrderProvider provider =
//         Provider.of<OrderProvider>(context, listen: false); 
//     return Padding(
//       padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           RoundedIconBtn(
//             icon: Icons.remove,
//             press: () {
//               setState(() {
//                   count == 1 ? count = 1 : count--;
//                   //provider.setCount(count);
//                   totalPrice = widget.product.price * count;
//                   //provider.setPrice(totalPrice);
//                 });
//             },
//           ),
//           SizedBox(width: getProportionateScreenWidth(40),child: Center(child: Text('$count')),),
//           RoundedIconBtn(
//             icon: Icons.add,
//             showShadow: true,
//             press: () {
//               setState(() {
//                 count++;
//                 provider.setCount(count);
//                 totalPrice = widget.product.price * count;
//                   provider.setPrice(totalPrice);
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class ColorDot extends StatelessWidget {
// //   const ColorDot({
// //     Key key,
// //     @required this.color,
// //     this.isSelected = false,
// //   }) : super(key: key);

// //   final Color color;
// //   final bool isSelected;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(right: 2),
// //       padding: EdgeInsets.all(getProportionateScreenWidth(8)),
// //       height: getProportionateScreenWidth(40),
// //       width: getProportionateScreenWidth(40),
// //       decoration: BoxDecoration(
// //         color: Colors.transparent,
// //         border:
// //             Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
// //         shape: BoxShape.circle,
// //       ),
// //       child: DecoratedBox(
// //         decoration: BoxDecoration(
// //           color: color,
// //           shape: BoxShape.circle,
// //         ),
// //       ),
// //     );
// //   }
// // }
