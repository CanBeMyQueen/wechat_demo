import 'package:flutter/material.dart';
import 'package:wechat_demo/chat_page.dart';
import 'package:wechat_demo/discover_page.dart';
import 'package:wechat_demo/friends_page.dart';
import 'package:wechat_demo/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 2;
  List <Widget>pages = [ChatPage(), FriendsPage(), DiscoverPage(), MinePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.black54,
          selectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
                icon: Image(
                  height: 23,
                  width: 23,
                  image: AssetImage('images/tabbar_chat.png'),),
                activeIcon: Image(
                  height: 23,
                  width: 23,
                  image: AssetImage('images/tabbar_chat_hl.png'),),
                label: '微信'),
            BottomNavigationBarItem(
                icon: Image(
              height: 23,
              width: 23,
              image: AssetImage('images/tabbar_friends.png'),),
                activeIcon: Image(
                  height: 23,
                  width: 23,
                  image: AssetImage('images/tabbar_friends_hl.png'),),
                label: '通讯录'),
            BottomNavigationBarItem(
                icon: Image(
              height: 23,
              width: 23,
              image: AssetImage('images/tabbar_discover.png'),),
                activeIcon: Image(
                  height: 23,
                  width: 23,
                  image: AssetImage('images/tabbar_discover_hl.png'),), label: '发现'),
            BottomNavigationBarItem(
                icon: Image(
              height: 23,
              width: 23,
              image: AssetImage('images/tabbar_mine.png'),),
                activeIcon: Image(
                  height: 23,
                  width: 23,
                  image: AssetImage('images/tabbar_mine_hl.png'),), label: '我'),
          ]),
      body: pages[currentIndex],
    );
  }
}
