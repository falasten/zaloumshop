import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/auth/splash/components/body.dart';
import 'package:zaloum_for_shopping/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
