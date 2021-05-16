// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/core/models/category_model.dart';
import 'package:zaloum_for_shopping/admin/core/repository/admin_client.dart';
import 'package:zaloum_for_shopping/admin/core/repository/admin_repository.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _allCategories = [];
  List<Category> _allActiveCategories = [];

  String title;

  get allCategories {
    getAllCategories();
    return _allCategories;
  }
  get allActiveCategories {
    getAllCategories();
    return _allActiveCategories;
  }

  setTitle(String title) {
    this.title = title;
    notifyListeners();
  }
  addNewCategory() async {
    try {
      Category category = Category(title: this.title);
      await AdminClient.adminClient.insertCategory(category);
      getAllCategories();
    } catch (error) {
      print(error);
    }
  }

  Future<List<Category>> getAllCategories() async {
    _allCategories = await AdminRepository.adminRepository.getAllCategories();
    _allActiveCategories=await AdminRepository.adminRepository.getActiveCategories();
    notifyListeners();
  }

  updateCategory(Category category) async {
    await AdminClient.adminClient.updateCategory(category);
    getAllCategories();
  }

  deleteCategory(String documentId) async {
    await AdminClient.adminClient.deleteCategory(documentId);
    getAllCategories();
  }
}
