import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaloum_for_shopping/auth/models/user_model.dart';

class FireAuthHelper {
  FireAuthHelper._();
  static FireAuthHelper fireAuthHelper = FireAuthHelper._();
  FirebaseAuth firebaseAuth;
  SharedPreferences prefs;
  FirebaseStorage firebaseStorage;
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth initFireAuth() {
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
      return firebaseAuth;
    } else {
      return firebaseAuth;
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

  Firestore firestore;
  Firestore initFireStore() {
    if (firestore == null) {
      firestore = Firestore.instance;
      return firestore;
    } else {
      return firestore;
    }
  }

  Future<SharedPreferences> instializeSp() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      return prefs;
    } else {
      return prefs;
    }
  }

  Future<String> registerByEmailAndPassword(UserModel userModel) async {
    try {
      firebaseAuth = initFireAuth();
      prefs = await instializeSp();
      AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.userEmail, password: userModel.password);
      FirebaseUser user = authResult.user;
      if (user != null) {
        firestore = initFireStore();
        firestore
            .collection('Users')
            .document(user.uid)
            .setData(userModel.toJson());
        prefs.setString('isDone', 'true');
        prefs.setString('userId', user.uid);
      } else {
        prefs.setString('isDone', 'false');
      }
    } catch (error) {
      print(error);
    }
  }

  addOneUserToFirestore(UserModel userModel) async {
    firestore = initFireStore();
    firestore.collection('Users').add(userModel.toJson());
  }

  updateProfile(UserModel userModel) async {
    try {
      firestore = initFireStore();
      prefs = await instializeSp();
      String userId=prefs.getString('userId');
      DocumentSnapshot documentSnapshot =
          await firestore.collection('Users').document(userId).get();
      if (documentSnapshot != null) {
        firestore = initFireStore();
        firebaseAuth = initFireAuth();
        await changeEmail(userModel.userEmail);
        firestore
            .collection('Users')
            .document(userId)
            .setData(userModel.toJson(),merge: true);
        prefs.setString('isUpdate', 'true');
      } else {
        prefs.setString('isUpdate', 'false');
      }
    } catch (error) {
      print(error);
    }
  }
  updateImage(File file) async {
    try {
      firebaseStorage=initFirebaseStorage();
      firestore = initFireStore();
      prefs = await instializeSp();
      String userId=prefs.getString('userId');
      DocumentSnapshot documentSnapshot =
          await firestore.collection('Users').document(userId).get();
      if (documentSnapshot != null) {
        String urlImage=await uploadImage(file);
        firestore = initFireStore();
        firestore
            .collection('Users')
            .document(userId)
            .setData(
              {'imageUrl':urlImage},merge: true);
        prefs.setString('isImageUpdate', 'true');
      } else {
        prefs.setString('isImageUpdate', 'false');
      }
    } catch (error) {
      print(error);
    }
  }
  Future<UserModel>getCurrentUser() async {
    try {
      firestore = initFireStore();
      prefs = await instializeSp();
      String userId=prefs.getString('userId');
      DocumentSnapshot documentSnapshot =
          await firestore.collection('Users').document(userId).get();
      if (documentSnapshot != null) {
        UserModel userModel=UserModel.fromDocumentSnapshot(documentSnapshot);
        prefs.setString('isFound', 'true');
        return userModel;
      } else {
        prefs.setString('isFound', 'false');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<UserModel>getUser(String userId) async {
    try {
      firestore = initFireStore();
      DocumentSnapshot documentSnapshot =
          await firestore.collection('Users').document(userId).get();
      if (documentSnapshot != null) {
        UserModel userModel=UserModel.fromDocumentSnapshot(documentSnapshot);
        //prefs.setString('isFound', 'true');
        return userModel;
      } else {
        //prefs.setString('isFound', 'false');
        
      }
    } catch (error) {
      print(error);
    }
  }

  Future<String> uploadImage(File file) async {
    try {
      firebaseStorage=initFirebaseStorage();
      DateTime dateTime = DateTime.now();
      StorageTaskSnapshot snapshot = await firebaseStorage
          .ref()
          .child('imagesFolder/$dateTime.png')
          .putFile(file)
          .onComplete;
      String url = await snapshot.ref.getDownloadURL();
      if(url==null){
        print('Url is null');
      }
      return url;
    } catch (error) {
      print(error);
    }
  }

  changeEmail(String email) async {
    try {
      firestore = initFireStore();
      firebaseAuth = initFireAuth();
      String userId=prefs.getString('userId');
      DocumentSnapshot documentSnapshot =
          await firestore.collection('Users').document(userId).get();
      if (documentSnapshot != null) {
        UserModel userModel=UserModel.fromDocumentSnapshot(documentSnapshot);
        firebaseAuth
    .signInWithEmailAndPassword(email: userModel.userEmail,password: userModel.password)
    .then((userCredential) {
        userCredential.user.updateEmail(email);
    });
        prefs.setString('isChangeAuthEmail', 'true');
        
      } else {
        prefs.setString('isChangeAuthEmail', 'false');
      }
    } catch (error) {
      print(error);
    }
  }
  Future<String> loginByEmailAndPassword(String email, String password) async {
    try {
      firestore = initFireStore();
      firebaseAuth = initFireAuth();
      prefs = await instializeSp();
      AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      DocumentSnapshot documentSnapshot =
          await firestore.collection('Users').document(user.uid).get();
      if (user != null) {
        prefs.setString('userName', user.displayName);
        prefs.setString('userId', user.uid);
        prefs.setString('isAdmin', documentSnapshot.data['IsAdmin'].toString());
        prefs.setBool('isLogged', true);
      }
    } catch (error) {
      print(error);
    }
  }
  
 Future<FirebaseUser> loginUsingGmail() async {
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      String accessToken = googleSignInAuthentication.accessToken;
      String idToken = googleSignInAuthentication.idToken;
      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: idToken, accessToken: accessToken);
      AuthResult authResult =
          await firebaseAuth.signInWithCredential(credential);
      return authResult.user;
    } catch (error) {
      print(error);
    }
  }
  signOutFromDevice() async {
    try {
      firebaseAuth = initFireAuth();
      prefs = await instializeSp();
      await firebaseAuth.signOut();
      prefs.setString('userName', '');
      prefs.setString('userId', '');
      prefs.setString('isAdmin', '');
      prefs.setBool('isLogged', false);
      prefs.setString('isDone', '');
    } catch (error) {
      print(error);
    }
  }

  Future<bool> checkUserLogin() async {
    try {
      prefs = await instializeSp();
      bool isLoggedUser = prefs.getBool('isLogged');
      return prefs.getBool('isLogged');
    } catch (error) {
      print(error);
    }
  }

  Future<String> checkAdminLogin() async {
    try {
      prefs = await instializeSp();
      String isLoggedAdmin = prefs.getString('isAdmin');
      return isLoggedAdmin;
    } catch (error) {
      print(error);
    }
  }

  Future<String> checkRegister() async {
    try {
      prefs = await instializeSp();
      String isDone = prefs.getString('isDone');
      return isDone;
    } catch (error) {
      print(error);
    }
  }

  resetPassword(String email) async {
    try {
      firebaseAuth = initFireAuth();
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (error) {
      print(error);
    }
  }
  Future<List<UserModel>> getAllUsers() async {
    try {
      firestore=initFireStore();
      QuerySnapshot querySnapshot =
          await firestore.collection('Users').where("IsAdmin", isEqualTo: false).getDocuments();
          List<UserModel> users =
        querySnapshot.documents.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
        //print(users);
    return users;
    } catch (error) {
      print(error);
    }
  }
}
