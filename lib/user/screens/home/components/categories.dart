import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/models/category_model.dart';
import 'package:zaloum_for_shopping/admin/core/providers/category_provider.dart';
import 'package:zaloum_for_shopping/admin/core/providers/product_provider.dart';

import '../../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<CategoryProvider>(context);
    List<Category> categoriesList = categoriesData.allCategories;
    ProductProvider provider =
        Provider.of<ProductProvider>(context, listen: false); 
    return SizedBox(
      height: 100,
      child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    provider.setCatValue(categoriesList[index].title);
                  },
                  child: CategoryCard(
                    text: categoriesList[index].title,
                    press: () {},
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
        child: Text(" $text  "));
  }
}
