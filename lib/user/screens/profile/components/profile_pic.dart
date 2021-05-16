import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/auth/models/user_model.dart';
import 'package:zaloum_for_shopping/auth/providers/user_provider.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    UserModel userModel = provider.currentUser;
    if (userModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            Consumer<UserProvider>(
              builder: (context, value, child) {
                String image = value.userModel.imageUrl;
                if (image == null) {
                  return Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(0, 4.0),
                            color: Colors.black38),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(0, 4.0),
                            color: Colors.black38),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
              },
            ),
            // CircleAvatar(
            //   backgroundImage: AssetImage("assets/images/profile.png"),
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
                      PickedFile pickedFile = await ImagePicker().getImage(
                          source: ImageSource.gallery,
                          maxHeight: 50,
                          maxWidth: 50);
                      File file = File(pickedFile.path);
                      Provider.of<UserProvider>(context, listen: false)
                          .updateImage(file);
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
}
