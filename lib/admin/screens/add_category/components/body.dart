import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/screens/add_category/components/categories_list.dart';
import 'package:zaloum_for_shopping/admin/screens/add_category/components/category_form.dart';
import 'package:zaloum_for_shopping/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: SizeConfig.screenWidth * 0.07, 
        right: SizeConfig.screenWidth * 0.07,
        //top: SizeConfig.screenHeight * 0.06,
        ),
      child: Column(
        children: [
          Center(child: Text("add category")),
          Divider(),
          SizedBox(height: 20),
          AddCategoriesForm(),
          SizedBox(height: 50),
          Center(child: Text("categories List")),
          Divider(),
          CategoryList(),
          SizedBox(height: 20),
          //CategoryList()
        ],
      ),
    );
  }
}
