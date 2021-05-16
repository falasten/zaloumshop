import 'package:flutter/widgets.dart';
import 'package:zaloum_for_shopping/admin/screens/add_category/add_categories_screen.dart';
import 'package:zaloum_for_shopping/admin/screens/add_products/add_products_screen.dart';
import 'package:zaloum_for_shopping/admin/screens/edit_products/edit_products_screen.dart';
import 'package:zaloum_for_shopping/admin/screens/home/home_screen.dart';
import 'package:zaloum_for_shopping/admin/screens/orders/orders_screen.dart';
import 'package:zaloum_for_shopping/admin/screens/profile/profile_screen.dart';
import 'package:zaloum_for_shopping/auth/complete_profile/complete_profile_screen.dart';
import 'package:zaloum_for_shopping/auth/forgot_password/forgot_password_screen.dart';
import 'package:zaloum_for_shopping/auth/login_success/login_success_screen.dart';
import 'package:zaloum_for_shopping/auth/sign_in/sign_in_screen.dart';
import 'package:zaloum_for_shopping/auth/sign_up/sign_up_screen.dart';
import 'package:zaloum_for_shopping/auth/splash/splash_screen.dart';
import 'package:zaloum_for_shopping/user/screens/cart/cart_screen.dart';
import 'package:zaloum_for_shopping/user/screens/details/details_screen.dart';
import 'package:zaloum_for_shopping/user/screens/edit_details/details_screen.dart';
import 'package:zaloum_for_shopping/user/screens/edit_profile/edit_profile_screen.dart';
import 'package:zaloum_for_shopping/user/screens/favourite/favourite_screen.dart';
import 'package:zaloum_for_shopping/user/screens/home/home_screen.dart';
import 'package:zaloum_for_shopping/user/screens/orders/orders_screen.dart';
import 'package:zaloum_for_shopping/user/screens/profile/profile_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  //auth
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  //user
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  OrdersScreen.routeName: (context) => OrdersScreen(),
  FavouriteScreen.routeName: (context) => FavouriteScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  EditDetailsScreen.routeName: (context) => EditDetailsScreen(),
  //admin
  AdminHomeScreen.routeName: (context) => AdminHomeScreen(),
  AddProductsScreen.routeName: (context) => AddProductsScreen(),
  EditProductsScreen.routeName: (context) => EditProductsScreen(),
  UserOrdersScreen.routeName: (context) => UserOrdersScreen(),
  AdminProfileScreen.routeName: (context) => AdminProfileScreen(),
  AddCategoriesScreen.routeName: (context) => AddCategoriesScreen(),
};
