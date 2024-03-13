import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference service =
      FirebaseFirestore.instance.collection("product");

  Future<String?> signInWithEmail(String email, String password) async {
    try {
      final result = _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(result);
      return "ok";
    } catch (e) {
      print("Sign in failed: $e");
      return null;
    }
  }

  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "ok";
    } catch (e) {
      print("Sign up failed: $e");
      return null;
    }
  }

  Future<void> addProduct(String productname, String description, int price) {
    return service.add({
      "productname": productname,
      "description": description,
      "price": price,
      "time": Timestamp.now()
    });
  }

  Future<void> updateProduct(String docID, String editProductName,
      String editDescription, int editPrice) {
    return service.doc(docID).update({
      "productname": editProductName,
      "description": editDescription,
      "price": editPrice,
      "time": Timestamp.now()
    });
  }

  Future<void> deleteProduct(String docID) {
    return service.doc(docID).delete();
  }

  Stream<QuerySnapshot> getProductList() {
    final productSnapshot =
        service.orderBy('time', descending: true).snapshots();
    return productSnapshot;
  }
}
