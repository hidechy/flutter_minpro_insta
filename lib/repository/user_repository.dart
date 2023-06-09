// ignore_for_file: avoid_catches_without_on_clauses

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data_model/user.dart';
import '../manager/database_manager.dart';

class UserRepository {
  UserRepository({required this.databaseManager});

  final DatabaseManager databaseManager;

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  static User? currentUser;

  ///
  Future<bool> isSignIn() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      currentUser =
          await databaseManager.getUserInfoFromDbById(firebaseUser.uid);

      return true;
    }
    return false;
  }

  ///
  Future<bool> signIn() async {
    try {
      final googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        return false;
      }

      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final firebaseUser = (await _auth.signInWithCredential(credential)).user;

      if (firebaseUser == null) {
        return false;
      }

      final isUserExistedInDb =
          await databaseManager.searchUserInDb(firebaseUser);

      if (!isUserExistedInDb) {
        await databaseManager.insertUser(
          _convertToUser(
            firebaseUser,
          ),
        );
      }

      currentUser =
          await databaseManager.getUserInfoFromDbById(firebaseUser.uid);

      return true;
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  ///
  User _convertToUser(auth.User firebaseUser) {
    return User(
      userId: firebaseUser.uid,
      displayName: firebaseUser.displayName ?? '',
      inAppUserName: firebaseUser.displayName ?? '',
      photoUrl: firebaseUser.photoURL ?? '',
      email: firebaseUser.email ?? '',
      bio: '',
    );
  }
}
