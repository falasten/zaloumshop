import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaloum_for_shopping/admin/components/product_card.dart';
import 'package:zaloum_for_shopping/admin/core/providers/product_provider.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    List<Product> products = productsData.allProducts;
    Provider.of<ProductProvider>(context, listen: false).searchProduct();
    return Consumer<ProductProvider>(builder: (context, value, child) {
      List<Product> allProducts = value.allSaerchProducts;
      if (allProducts.isEmpty) {
        return Expanded(
          child: GridView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.all(25.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items in row
                childAspectRatio: 0.70,
                crossAxisSpacing: 15.0, // Space between columns
                mainAxisSpacing: 10, // Space between rows
              ),
              itemBuilder: (context, index) {
                // Listen to specific object
                return ProductCard(product: products[index]);
              }),
        );
      } else {
        return Expanded(
          child: GridView.builder(
              itemCount: allProducts.length,
              padding: const EdgeInsets.all(25.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items in row
                childAspectRatio: 0.70,
                crossAxisSpacing: 15.0, // Space between columns
                mainAxisSpacing: 10, // Space between rows
              ),
              itemBuilder: (context, index) {
                // Listen to specific object
                return ProductCard(product: allProducts[index]);
              }),
        );
      }
    });
  }
}
