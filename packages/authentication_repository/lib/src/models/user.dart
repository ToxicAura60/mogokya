import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.uid,
    this.email,
    this.phoneNumber,
    this.name,
    this.photoURL,
  });

  final String? email;
  final String? phoneNumber;
  final String uid;
  final String? name;
  final String? photoURL;
  static const empty = User(uid: '');

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
    };
  }

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, uid, name, photoURL, phoneNumber];
}
