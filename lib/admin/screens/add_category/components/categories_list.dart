import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/models/category_model.dart';
import 'package:zaloum_for_shopping/admin/core/providers/category_provider.dart';

import '../../../../size_config.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<CategoryProvider>(context);
    List<Category> categories = categoriesData.allActiveCategories;
    return SizedBox(
      height: 400,
      child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          child: ListView.builder(
              //scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    categoriesData.deleteCategory(categories[index].documentId);
                  },
                  child: CategoryCard(
                    text: categories[index].title,
                    press: () {
                      
                    },
                  ),
                );
              })),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(5)),
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        decoration: BoxDecoration(
          color: Color(0xFFFFECDF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(" $text"));
  }
}
