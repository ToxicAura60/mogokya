import 'package:app1/app/bloc/app_bloc.dart';
import 'package:app1/chat/cubit/chat_cubit.dart';
import 'package:app1/chat/view/chat_view.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messaging_repository/messaging_repository.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    required roomId,
    super.key,
  }) : _roomId = roomId;

  final String _roomId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        roomId: _roomId,
      ),
      child: ChatView(),
    );
  }
}
