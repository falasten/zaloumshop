import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';
import 'package:zaloum_for_shopping/admin/core/providers/product_provider.dart';
import 'package:zaloum_for_shopping/user/components/product_card.dart';

// import '../../../size_config.dart';
// import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    List<Product> products = productsData.favoriteProducts;
    if(products.isEmpty){
      return Center(
        child: Text("No Favourite Products Yet",textAlign: TextAlign.center,),
      );
    }else{
      return Expanded(
      child: GridView.builder(
          itemCount: products.length,
          padding: const EdgeInsets.all(25.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in row
            childAspectRatio: 0.75,
            crossAxisSpacing: 15.0, // Space between columns
            mainAxisSpacing: 10, // Space between rows
          ),
          itemBuilder: (context, index) {
            // Listen to specific object
            return ProductCard(product: products[index]);
          }),
    );
    }
  }
}
