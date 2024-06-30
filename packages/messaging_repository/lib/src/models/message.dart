import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  Message(
      {required this.senderId,
      required this.receiverId,
      required this.message,
      required this.timestamp});
  final String senderId;
  final String receiverId;
  final String message;
  final firestore.Timestamp timestamp;

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }

  @override
  List<Object?> get props => [senderId, receiverId, message, timestamp];
}
