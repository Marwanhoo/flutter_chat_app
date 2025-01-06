import 'package:flutter/material.dart';
import 'package:flutter_chat_app/custom_chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return CustomChat();
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: 10,
      ),
    );
  }
}
