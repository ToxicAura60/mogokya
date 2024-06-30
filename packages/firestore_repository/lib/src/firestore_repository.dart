import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;

class FirestoreRepository {
  FirestoreRepository({
    firebase_firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? firebase_firestore.FirebaseFirestore.instance;

  final firebase_firestore.FirebaseFirestore _firebaseFirestore;

  Stream<firebase_firestore.QuerySnapshot> getMechanic() {
    return _firebaseFirestore.collection('mechanic').snapshots();
  }

  Stream getUserDetail({required String userId}) {
    return _firebaseFirestore.collection('mechanic').doc(userId).snapshots();
  }
}
