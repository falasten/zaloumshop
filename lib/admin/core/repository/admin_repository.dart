import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zaloum_for_shopping/admin/core/models/admin_order_model.dart';
import 'package:zaloum_for_shopping/admin/core/models/category_model.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';
import 'package:zaloum_for_shopping/admin/core/repository/admin_client.dart';

class AdminRepository {
  AdminRepository._();
  static AdminRepository adminRepository = AdminRepository._();
  Future<List<Product>> getAllProducts() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getAllProducts();
    List<Product> products =
        documents.map((e) => Product.fromDocumentSnapshot(e)).toList();
        //print(products);
    return products;
  }

  Future<List<Category>> getAllCategories() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getAllCategories();
    List<Category> categories =
        documents.map((e) => Category.fromDocumentSnapshot(e)).toList();
        //print(products);
    return categories;
  }

  Future<List<Category>> getActiveCategories() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getActiveCategories();
    List<Category> categories =
        documents.map((e) => Category.fromDocumentSnapshot(e)).toList();
        //print(products);
    return categories;
  }

  // Future<Coffee> getOneCoffees(String productId) async {
  //   DocumentSnapshot documents =
  //       await AdminClient.adminClient.getOneCoffee(productId);
  //   Coffee coffee = Coffee.fromDocumentSnapshot(documents);
  //   return coffee;
  // }

  Future<List<AdminOrder>> getAllOrders() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getAllOrders();
    List<AdminOrder> orders =
        documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
    return orders;
  }

  Future<List<AdminOrder>> getAllSpecialOrders() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getAllSpecialOrders();
    List<AdminOrder> orders =
        documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
    return orders;
  }

  Future<List<AdminOrder>> getMyOrders() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getMyOrders();
    List<AdminOrder> orders =
        documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
    return orders;
  }
  
   Future<List<AdminOrder>> getMySpecialOrders() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getMySpecialOrders();
    List<AdminOrder> orders =
        documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
    return orders;
  }
  
  Future<List<AdminOrder>> getUserOrders(String userId) async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getUserOrders(userId);
    List<AdminOrder> orders =
        documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
    return orders;
  }
  // Future<List<AdminOrder>> getSpecialUserOrders(String userId) async {
  //   List<DocumentSnapshot> documents =
  //       await AdminClient.adminClient.getSpecialUserOrders(userId);
  //   List<AdminOrder> orders =
  //       documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
  //   return orders;
  // }
  Future<double> getTotla() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getAllOrders();
    List<AdminOrder> orders =
        documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
    double totalPrice = 0.0;
    orders.forEach((element) {
      totalPrice += element.productPrice;
    });
    return totalPrice;
  }

  Future<double> getMyTotla() async {
    List<DocumentSnapshot> documents =
        await AdminClient.adminClient.getMyOrders();
    List<AdminOrder> orders =
        documents.map((e) => AdminOrder.fromDocumentSnapshot(e)).toList();
    double totalPrice = 0.0;
    orders.forEach((element) {
      totalPrice += element.productPrice;
    });
    return totalPrice;
  }

  deleteOrder(String orderId) async {
    try {
      await AdminClient.adminClient.deleteOrder(orderId);
    } catch (error) {
      print(error);
    }
  }

  Future<List<Product>> searchProduct(String title) async {
  List<DocumentSnapshot> documents =
     await AdminClient.adminClient.searchProductName(title);
   List<Product> products = documents
    .map((e) => Product.fromDocumentSnapshot(e) ?? null)
   .toList();
  
  return products;
  }

  Future<List<Product>> catProduct(String category) async {
  List<DocumentSnapshot> documents =
     await AdminClient.adminClient.searchProductCat(category);
   List<Product> catProducts = documents
    .map((e) => Product.fromDocumentSnapshot(e) ?? null)
   .toList();
  
  return catProducts;
  }
  
}
