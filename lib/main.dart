import 'package:flutter/material.dart';
import 'package:wechat_demo/root_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'wechat',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        highlightColor: const Color.fromRGBO(1, 0, 0, 0),
        splashColor: const Color.fromRGBO(1, 0, 0, 0),
      ),
      home: const RootPage()
    );
  }
}




