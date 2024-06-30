import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:go_router/go_router.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        centerTitle: false,
        shape: Border(
            bottom: BorderSide(
          color: Color(0xFFDEDEDE),
          width: 1,
        )),
      ),
      body: StreamBuilder<List<types.Room>>(
        stream: FirebaseChatCore.instance.rooms(),
        initialData: [],
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {}

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }

              final room = snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text(
                  "${room.name}",
                ),
                onTap: () {
                  context.go("/chat/${room.id}");
                },
              );
            },
          );
        },
      ),
    );
  }
}
