import 'package:flutter/material.dart';
import 'package:onproperty/components/chat_components.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: chatList(),
      ),
    );
  }

  ListView chatList() {
    return ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return index==0?SizedBox(height: 15,):verticalChatList(context,index);
        });
  }
}
