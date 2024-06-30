import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class LogOutFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    firebase_firestore.FirebaseFirestore? firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firebaseFirestore =
            firebaseFirestore ?? firebase_firestore.FirebaseFirestore.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final firebase_firestore.FirebaseFirestore _firebaseFirestore;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      return user;
    });
  }

  User get currentUser {
    return _firebaseAuth.currentUser == null
        ? User.empty
        : _firebaseAuth.currentUser!.toUser;
  }

  Future<void> LogInWithPhoneNumber({
    required String phoneNumber,
    required void Function(String) codeSent,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (firebase_auth.PhoneAuthCredential credential) {},
      verificationFailed: (firebase_auth.FirebaseAuthException e) {
        print(e);
      },
      codeSent: (String verificationId, int? resendToken) async {
        codeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> insertUserToFirestore(
      {required String userId, required User user}) async {
    await _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('messages')
        .add(user.toMap());
  }

  Future<void> verifyPhoneNumber({
    required verificationId,
    required smsCode,
  }) async {
    firebase_auth.PhoneAuthCredential credential =
        firebase_auth.PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(
      uid: uid,
      email: email,
      phoneNumber: phoneNumber,
      name: displayName,
      photoURL: photoURL,
    );
  }
}
