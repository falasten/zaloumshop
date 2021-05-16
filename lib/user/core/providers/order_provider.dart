import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/user/core/database/dbhelper.dart';
import 'package:zaloum_for_shopping/user/core/models/order_model.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _allOrders = [];
  List<Order> cart = [];
  List<Order> specialProducts =[];

  double totalCartValue = 0;
  get allOrders {
    getUserOrders();
    getAllOrders();
    return _allOrders;
  }
  get userOrders {
    getUserOrders();
    getAllOrders();
    return cart;
  }
  get specialOrders {
    getspecialOrders();
    return specialProducts;
  }

  Future<List<Order>> getAllOrders() async {
    List<Map<String, dynamic>> allOrders =
        await DBHelper.dbHelper.getAllOrders();
    _allOrders = allOrders.map((e) => Order.fromJson(e)).toList();
  }

  Future<double> getTotal() async {
    double totalPrice = 0.0;
    List<Map<String, dynamic>> allOrders =
        await DBHelper.dbHelper.getAllOrders();
    List<Order> orders = allOrders.map((e) => Order.fromJson(e)).toList();
    orders.forEach((element) {
      totalPrice += element.productPrice;
    });
    return totalPrice;
  }
 
  Future<List<Order>> getUserOrders() async {
    List<Map<String, dynamic>> allOrders =
        await DBHelper.dbHelper.getUserOrders();
    cart = allOrders.map((e) => Order.fromJson(e)).toList();
    print(cart);
    //return orders;
  }

  Future<List<Order>> getspecialOrders() async {
    List<Map<String, dynamic>> allOrders =
        await DBHelper.dbHelper.getUserOrders();
  List<Order> l = allOrders.map((e) => Order.fromJson(e)).toList();
  specialProducts.add(l[l.length-1]);
  specialProducts.add(l[l.length-2]);
  specialProducts.add(l[l.length-3]);
  notifyListeners();
    //print(cart);
    //return orders;
  }

  excuteAllOrdersMethod() {
    getUserOrders();
    getAllOrders();
    getTotal();
    notifyListeners();
  }

  insertNewOrder(Order order) async {
    await DBHelper.dbHelper.insertNewOrder(order);
    excuteAllOrdersMethod();
    notifyListeners();
  }

  updateOrder(Order order) async {
    await DBHelper.dbHelper.updateOrder(order);
    excuteAllOrdersMethod();
  }

  deleteOrder(Order order) async {
    await DBHelper.dbHelper.deleteFromOrders(order);
    excuteAllOrdersMethod();
  }

  deleteAll() async {
    await DBHelper.dbHelper.deleteAllOrders();
    excuteAllOrdersMethod();
    cart=[];
  }
}
