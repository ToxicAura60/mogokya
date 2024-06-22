import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:cache/cache.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    //CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : //_cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  //final CacheClient _cache;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  static const userCacheKey = '__user_cache_key__';

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      // _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  User get currentUser {
    //return _cache.read<User>(key: userCacheKey) ?? User.empty;
    return User.empty;
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
      codeSent: (String verificationId, int? resendToken) {
        codeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOtp({
    required verificationId,
    required smsCode,
  }) async {
    firebase_auth.PhoneAuthCredential credential =
        firebase_auth.PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

    await _firebaseAuth.signInWithCredential(credential);
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
