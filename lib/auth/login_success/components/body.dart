import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/screens/home/home_screen.dart';
import 'package:zaloum_for_shopping/auth/components/default_button.dart';
import 'package:zaloum_for_shopping/auth/repository/auth_client.dart';
import 'package:zaloum_for_shopping/size_config.dart';
import 'package:zaloum_for_shopping/user/screens/home/home_screen.dart';

class Body extends StatelessWidget {

toHomeScreen(BuildContext context) async{
          String isAdmin = await FireAuthHelper.fireAuthHelper.checkAdminLogin();
          if (isAdmin == 'true') {
            Navigator.pushNamed(context, AdminHomeScreen.routeName);
          } else {
            Navigator.pushNamed(context, HomeScreen.routeName);
          }
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,
          width: SizeConfig.screenWidth, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Go to home",
            press: () {
              toHomeScreen(context);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
