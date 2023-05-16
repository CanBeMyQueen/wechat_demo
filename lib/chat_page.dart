import 'package:flutter/material.dart';
import 'package:wechat_demo/main.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('微信'),
      ),
      body: const Center(
        child: Text('微信页面'),
      ),
    );
  }
}
