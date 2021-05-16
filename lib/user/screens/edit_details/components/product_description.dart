// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';
// import 'package:zaloum_for_shopping/user/core/providers/order_provider.dart';

// import '../../../../constants.dart';
// import '../../../../size_config.dart';

// class ProductDescription extends StatefulWidget {
//   const ProductDescription({
//     Key key,
//     @required this.product,
//     this.pressOnSeeMore,
//   }) : super(key: key);

//   final Product product;
//   final GestureTapCallback pressOnSeeMore;

//   @override
//   _ProductDescriptionState createState() => _ProductDescriptionState();
// }

// class _ProductDescriptionState extends State<ProductDescription> {
  
//   int count=1;
//   double totalPrice;
//   @override
//   void initState() {
//     totalPrice = widget.product.price * count;
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     OrderProvider provider =
//         Provider.of<OrderProvider>(context);
//         //WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
//     //}));
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//           child: Text(
//             widget.product.title,
//             style: Theme.of(context).textTheme.headline6,
//           ),
//         ),
//         Align(
//           alignment: Alignment.centerRight,
//           child: Container(
//             padding: EdgeInsets.all(getProportionateScreenWidth(15)),
//             width: getProportionateScreenWidth(64),
//             decoration: BoxDecoration(
//               color:
//                   widget.product.isFavorite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 bottomLeft: Radius.circular(20),
//               ),
//             ),
//             child: SvgPicture.asset(
//               "assets/icons/Heart Icon_2.svg",
//               color:
//                   widget.product.isFavorite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
//               height: getProportionateScreenWidth(16),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(
//             left: getProportionateScreenWidth(20),
//             right: getProportionateScreenWidth(64),
//           ),
//           child: Text(
//             widget.product.description,
//             maxLines: 3,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: getProportionateScreenWidth(20),
//             vertical: 10,
//           ),
//           child: GestureDetector(
//             onTap: () {},
//             child: Row(
//               children: [
//                 Text(
//                   "${provider.price??totalPrice}",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w600, color: kPrimaryColor,fontSize: 15),
//                 ),
//                 SizedBox(width: 5),
//                 Padding(
//                         padding: const EdgeInsets.only(top: 5),
//                         child: Image.asset("assets/images/nis.png",
//                             height: 12, color: kPrimaryColor),
//                       ),
//                 // Icon(
//                 //   Icons.arrow_forward_ios,
//                 //   size: 12,
//                 //   color: kPrimaryColor,
//                 // ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
