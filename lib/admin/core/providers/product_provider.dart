import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';
import 'package:zaloum_for_shopping/admin/core/repository/admin_client.dart';
import 'package:zaloum_for_shopping/admin/core/repository/admin_repository.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> allSaerchProducts = [];
  List<Product> allCatProducts = [];

  String title;
  double price;
  String imageUrl;
  String category;
  String description;
  String searchValue;
  String catValue="All";

  get allProducts {
    getAllProducts();
    return _allProducts;
  }

  List<Product> get favoriteProducts {
    return _allProducts.where((product) => product.isFavorite).toList();
  }

  setSearchValue(String searchValue) {
    this.searchValue = searchValue;
    notifyListeners();
  }

  setCatValue(String catValue) {
    this.catValue = catValue;
    notifyListeners();
  }

  setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  setCategory(String category) {
    this.category = category;
    notifyListeners();
  }
  setDescription(String description) {
    this.description = description;
    notifyListeners();
  }
  setPrice(String price) {
    try {
      this.price = double.parse(price);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  uploadImage(File file) async {
    String url = await AdminClient.adminClient.uploadImage(file);
    this.imageUrl = url;
    notifyListeners();
  }

  getImageUrl(File file) async {
    String url = await AdminClient.adminClient.uploadImage(file);
    return url;
  }

  changeFavoriteStatus(Product product) {
    product.isFavorite = !product.isFavorite;
    updateProduct(product);
    notifyListeners();
  }

  addNewProduct() async {
    try {
      Product product = Product(
          imageUrl: this.imageUrl,
          title: this.title,
          price: this.price,
          category: this.category,
          description: this.description,
          );
      await AdminClient.adminClient.insertProduct(product);
      getAllProducts();
      this.imageUrl = null;
    } catch (error) {
      print(error);
    }
  }

  Future<List<Product>> getAllProducts() async {
    _allProducts = await AdminRepository.adminRepository.getAllProducts();
    notifyListeners();
  }

  updateProduct(Product product) async {
    await AdminClient.adminClient.updateProduct(product);
    getAllProducts();
    this.imageUrl = null;
  }

  deleteProduct(String documentId) async {
    await AdminClient.adminClient.deleteProduct(documentId);
    await getAllProducts();
    notifyListeners();
  }

  Product findProduct(String documentId) {
    return _allProducts
        .where((product) => product.documentId == documentId)
        .toList()
        .first;
  }

  // searchProduct(String title) async {
  //   allSaerchProducts =
  //       await AdminRepository.adminRepository.searchProduct(title);
    
  //   notifyListeners();
  //   return allSaerchProducts ?? null;
  // }
  // 
  searchProduct() async {
    allSaerchProducts =
        await AdminRepository.adminRepository.searchProduct(searchValue);
    notifyListeners();
    return allSaerchProducts ?? null;
  }
  catProduct() async {
    allCatProducts =
        await AdminRepository.adminRepository.catProduct(catValue);
    notifyListeners();
    return allCatProducts ?? null;
  }
  
}
