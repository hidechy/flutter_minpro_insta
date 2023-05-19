// ignore_for_file: cast_nullable_to_non_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../data_model/user.dart';

class DatabaseManager {
  ///
  Future<bool> searchUserInDb(auth.User firebaseUser) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: firebaseUser.uid)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return true;
    }

    return false;
  }

  ///
  Future<void> insertUser(User user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.userId)
        .set(user.toMap());
  }

  ///
  Future<User> getUserInfoFromDbById(String userId) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: userId)
        .get();

    return User.fromMap(snapshot.docs[0].data() as Map<String, dynamic>);
  }
}
