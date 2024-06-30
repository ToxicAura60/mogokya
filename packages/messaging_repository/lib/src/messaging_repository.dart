import 'package:cloud_firestore/cloud_firestore.dart' as firebase_firestore;
import 'models/models.dart';

class MessagingRepository {
  MessagingRepository({
    firebase_firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
            firebaseFirestore ?? firebase_firestore.FirebaseFirestore.instance;

  final firebase_firestore.FirebaseFirestore _firebaseFirestore;

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String message,
  }) async {
    firebase_firestore.Timestamp timestamp = firebase_firestore.Timestamp.now();

    Message newMessage = Message(
      senderId: senderId,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<firebase_firestore.QuerySnapshot> getMessages({
    required String senderId,
    required String receiverId,
  }) {
    List<String> ids = [
      senderId,
      receiverId,
    ];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy("timestamp", descending: true)
        .snapshots();
  }

  Stream<firebase_firestore.QuerySnapshot> getListUser() {
    return _firebaseFirestore.collection("users").snapshots();
  }

  Stream getUserDetail({required String userId}) {
    return _firebaseFirestore.collection('users').doc(userId).snapshots();
  }
}
