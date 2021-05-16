import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/providers/product_provider.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';
class ProfilePic extends StatelessWidget {
  final Product product;
 String imageUrl;
   ProfilePic({
    this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider provider =
        Provider.of<ProductProvider>(context, listen: false);
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Consumer<ProductProvider>(
            builder: (context, value, child) {
              String image1 = value.imageUrl;
              if (image1 == null) {
                imageUrl = product.imageUrl;
                product.imageUrl=imageUrl;
                provider.updateProduct(product);
                return Center(
                    child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(product.imageUrl)));
              } else {
                imageUrl = image1;
                product.imageUrl=imageUrl;
                provider.updateProduct(product);
                return Center(
                    child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(image1),
                ));
              }
            },
          ),
          // CircleAvatar(
          //   backgroundImage: AssetImage("assets/images/no_photo.jpg"),
          // ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () async {
                  try {
                    PickedFile pickedFile1 = await ImagePicker().getImage(
                        source: ImageSource.gallery,
                        maxHeight: 150,
                        maxWidth: 150);
                    File file1 = File(pickedFile1.path);
                    Provider.of<ProductProvider>(context, listen: false)
                        .uploadImage(file1);
                  } catch (error) {
                    print(error);
                  }
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
