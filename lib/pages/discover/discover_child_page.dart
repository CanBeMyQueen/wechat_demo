import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';

class DiscoverChildPage extends StatelessWidget {
  final String title;
  const DiscoverChildPage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WechatThemeColor,
        title: Text(title),
      ),
      body: Center(
        child: Text(title)
      ),
    );
  }
}
