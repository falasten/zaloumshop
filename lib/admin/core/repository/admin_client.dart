import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaloum_for_shopping/admin/core/models/category_model.dart';
import 'package:zaloum_for_shopping/admin/core/models/product_model.dart';
import 'package:zaloum_for_shopping/auth/repository/auth_client.dart';

class AdminClient {
  AdminClient._();
  static AdminClient adminClient = AdminClient._();
  FirebaseStorage firebaseStorage;
  Firestore firestore;

  Firestore initFirestore() {
    if (firestore == null) {
      firestore = Firestore.instance;
      return firestore;
    } else {
      return firestore;
    }
  }

  FirebaseStorage initFirebaseStorage() {
    if (firebaseStorage == null) {
      firebaseStorage = FirebaseStorage.instance;
      return firebaseStorage;
    } else {
      return firebaseStorage;
    }
  }

  Future<String> insertProduct(Product product) async {
    try {
      firestore = initFirestore();
      DocumentReference documentReference =
          await firestore.collection("Products").add(product.toJson());
      assert(documentReference.documentID != null);
      return documentReference.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<String> insertCategory(Category category) async {
    try {
      firestore = initFirestore();
      DocumentReference documentReference =
          await firestore.collection("Categories").add(category.toJson());
      assert(documentReference.documentID != null);
      return documentReference.documentID;
    } catch (error) {
      print(error);
    }
  }

  Future<String> uploadImage(File file) async {
    try {
      firebaseStorage = initFirebaseStorage();
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorage
          .ref()
          .child('imagesFolder/$dateTime.jpg')
          .putFile(file)
          .onComplete;
      String url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllProducts() async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot =
          await firestore.collection("Products").getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllCategories() async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot =
          await firestore.collection("Categories").getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getActiveCategories() async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot = await firestore
          .collection("Categories")
          .where("isActive", isEqualTo: true)
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getMyOrders() async {
    try {
      firestore = initFirestore();
      SharedPreferences prefs;
      prefs = await FireAuthHelper.fireAuthHelper.instializeSp();
      String userId = prefs.getString('userId');
      QuerySnapshot querySnapshot = await firestore
          .collection('Orders')
          .where("OrderUserId", isEqualTo: userId)
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getMySpecialOrders() async {
    try {
      firestore = initFirestore();
      SharedPreferences prefs;
      prefs = await FireAuthHelper.fireAuthHelper.instializeSp();
      String userId = prefs.getString('userId');
      QuerySnapshot querySnapshot = await firestore
          .collection('Orders')
          .where("OrderUserId", isEqualTo: userId)
          .orderBy("orderProductTimeNow", descending: true)
          .limit(3)
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getUserOrders(String userId) async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot = await firestore
          .collection('Orders')
          .where("OrderUserId", isEqualTo: userId)
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  updateProduct(Product product) async {
    try {
      firestore = initFirestore();
      firestore
          .collection("Products")
          .document(product.documentId)
          .setData(product.toJson());
    } catch (error) {
      print(error);
    }
  }

  updateCategory(Category category) async {
    try {
      firestore = initFirestore();
      firestore
          .collection("Categories")
          .document(category.documentId)
          .setData(category.toJson());
    } catch (error) {
      print(error);
    }
  }

  deleteProduct(String documentId) async {
    try {
      firestore = initFirestore();
      await firestore
          .collection("Products")
          .document(documentId)
          .delete()
          .whenComplete(() => print("deleteeeeed"));
    } catch (error) {
      print(error);
    }
  }

  deleteCategory(String documentId) async {
    try {
      firestore = initFirestore();
      firestore.collection("Categories").document(documentId).delete();
    } catch (error) {
      print(error);
    }
  }

  Future<Product> findProduct(String documentId) async {
    try {
      firestore = initFirestore();
      DocumentSnapshot documentSnapshot =
          await firestore.collection("Products").document(documentId).get();
      Product product = Product.fromDocumentSnapshot(documentSnapshot);
      return product;
    } catch (error) {
      print(error);
    }
  }

  deleteOrder(String orderId) async {
    try {
      firestore = initFirestore();
      firestore.collection('Orders').document(orderId).delete();
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllOrders() async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot =
          await firestore.collection('Orders').getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> getAllSpecialOrders() async {
    try {
      firestore = initFirestore();
      QuerySnapshot querySnapshot = await firestore
          .collection('Orders')
          .orderBy("orderProductTimeNow", descending: true)
          .limit(3)
          .getDocuments();
      return querySnapshot.documents;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> searchProductName(String productName) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection("Products")
          .where('title', isEqualTo: productName)
          .getDocuments();

      return querySnapshot.documents ?? null;
    } catch (error) {
      print(error);
    }
  }

  Future<List<DocumentSnapshot>> searchProductCat(
      String productCategory) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection("Products")
          .where('category', isEqualTo: productCategory)
          .getDocuments();

      return querySnapshot.documents ?? null;
    } catch (error) {
      print(error);
    }
  }
}
