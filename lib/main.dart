import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/providers/category_provider.dart';
import 'package:zaloum_for_shopping/admin/core/providers/order_admin_provider.dart';
import 'package:zaloum_for_shopping/auth/splash/splash_screen.dart';
import 'package:zaloum_for_shopping/routes.dart';
import 'package:zaloum_for_shopping/theme.dart';
import 'package:zaloum_for_shopping/auth/providers/user_provider.dart';
import 'package:zaloum_for_shopping/admin/core/providers/product_provider.dart';
import 'package:zaloum_for_shopping/user/core/providers/order_provider.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (BuildContext context) {
            return ProductProvider();
          },
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (BuildContext context) {
            return CategoryProvider();
          },
        ),
        ChangeNotifierProvider<OrderProvider>(
          create: (BuildContext context) {
            return OrderProvider();
          },
        ),
        ChangeNotifierProvider<AdminOrderProvider>(
          create: (BuildContext context) {
            return AdminOrderProvider();
          },
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (BuildContext context) {
            return UserProvider();
          },
        ),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zaloum Shop',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}