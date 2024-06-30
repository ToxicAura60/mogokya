import 'package:app1/app/bloc/app_bloc.dart';
import 'package:app1/chat/cubit/chat_cubit.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go("/home"),
        ),
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text("Samuel Chandra"),
        shape: Border(
          bottom: BorderSide(
            color: Color(0xFFDEDEDE),
            width: 1,
          ),
        ),
      ),
      body: StreamBuilder<types.Room>(
          stream: FirebaseChatCore.instance
              .room(context.read<ChatCubit>().state.roomId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingAnimationWidget.newtonCradle(
                color: Color(0xFF000000),
                size: 20,
              );
            }
            return StreamBuilder<List<types.Message>>(
              initialData: const [],
              stream: FirebaseChatCore.instance.messages(snapshot.data!),
              builder: (context, snapshot) => Chat(
                messages: snapshot.data ?? [],
                onSendPressed: (message) =>
                    context.read<ChatCubit>().sendMessage(message),
                user: types.User(
                  id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
                ),
              ),
            );
          }),
    );
  }
}
