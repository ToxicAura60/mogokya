import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:messaging_repository/messaging_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({
    required roomId,
  })  : _roomId = roomId,
        super(ChatState(
          roomId: roomId,
        ));

  final String _roomId;

  void sendMessage(types.PartialText message) {
    FirebaseChatCore.instance.sendMessage(
      message,
      _roomId,
    );
  }
}
