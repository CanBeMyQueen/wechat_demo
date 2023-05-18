import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';

import '../../cell_line.dart';
import '../../const.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发现'),
        backgroundColor: WechatThemeColor,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        color: WechatThemeColor,
        child: ListView(
          children: [
            const DiscoverCell(title: '朋友圈', imageName: 'images/朋友圈.png'),
            Container(height: 10,),
            const DiscoverCell(title: '扫一扫', imageName: 'images/扫一扫.png', line: true,),
            CellLine(),
            const DiscoverCell(title: '摇一摇', imageName: 'images/摇一摇.png'),
            Container(height: 10,),
            const DiscoverCell(title: '看一看', imageName: 'images/看一看icon.png', line: true,),
            CellLine(),
            const DiscoverCell(title: '搜一搜', imageName: 'images/搜一搜.png'),
            Container(height: 10,),
            const DiscoverCell(title: '附近的人', imageName: 'images/附近的人icon.png', line: true,),
            Container(height: 10,),
            const DiscoverCell(title: '购物', imageName: 'images/购物.png', line: true, subTitle: '618限时特购', subImage: true,),
            CellLine(),
            const DiscoverCell(title: '游戏', imageName: 'images/游戏.png'),
            Container(height: 10,),
            const DiscoverCell(title: '小程序', imageName: 'images/小程序.png'),
          ],
        ),
      ),
    );
  }
}
