import 'package:flutter/material.dart';
import 'package:zaloum_for_shopping/admin/core/models/admin_order_model.dart';
import 'package:zaloum_for_shopping/admin/core/repository/admin_repository.dart';

class AdminOrderProvider extends ChangeNotifier {
  List<AdminOrder> allOrders = [];
  List<AdminOrder> myOrders = [];
  List<AdminOrder> userOrders = [];
  List<AdminOrder> mySpecialOrders = [];
  List<AdminOrder> specialOrdersList = [];

  double totalPrice=0.0;
  double myTotalPrice=0.0;
  String productId;
  int orderCount;
  String userId;

  get allOrder{
    getAllOrders();
    return allOrders;
  }
  get allPrice{
    getAllOrders();
    getTotal();
    return totalPrice;
  }
get myPrice{
    getMyOrders();
    getMyTotal();
    return myTotalPrice;
  }
  get myOrder{
    getMyOrders();
    return myOrders;
  }

  get specialOrders{
    // getMySpecialOrders();
    getAllSpecialOrders();
    // if(mySpecialOrders==[]|| mySpecialOrders.length<3){
    //   return specialOrdersList;
    // }else{
      return specialOrdersList;
    //}
    
  }

  Future<List<AdminOrder>> getAllOrders() async {
    allOrders = await AdminRepository.adminRepository.getAllOrders();
    getAllSpecialOrders();
    notifyListeners();
  }

   Future<List<AdminOrder>> getAllSpecialOrders() async {
    specialOrdersList = await AdminRepository.adminRepository.getAllSpecialOrders();
    notifyListeners();
  }

  Future<List<AdminOrder>> getMyOrders() async {
    myOrders = await AdminRepository.adminRepository.getMyOrders();
    notifyListeners();
  }

  Future<List<AdminOrder>> getUserOrders(String userId) async {
    userOrders = await AdminRepository.adminRepository.getUserOrders(userId);
    notifyListeners();
    //return userOrders;
  }
   Future<List<AdminOrder>> getMySpecialOrders() async {
    mySpecialOrders = await AdminRepository.adminRepository.getMySpecialOrders();
    notifyListeners();
  }

  List<AdminOrder> userOrder(String userId){
    getUserOrders(userId);
    return userOrders;
  }

  Future<double> getTotal() async {
    totalPrice = await AdminRepository.adminRepository.getTotla();
    notifyListeners();
  }
  Future<double> getMyTotal() async {
    myTotalPrice = await AdminRepository.adminRepository.getMyTotla();
    notifyListeners();
  }
  deleteOrder(String ordertId) async {
    await AdminRepository.adminRepository.deleteOrder(ordertId);
    getAllOrders();
  }
}
