import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/pages/chat/search_page.dart';

import 'chat_data.dart';

class SearchBarChat extends StatelessWidget {

  final List<ChatModel> datas;
  const SearchBarChat({required this.datas});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SearchPage(datas: datas,)));
      },
      child: Container(
        height: 50,
        color: WechatThemeColor,
        padding: const EdgeInsets.only(top: 5, bottom: 10, right: 10, left: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/放大镜b.png'), color: Colors.grey, width: 20,),
                Text("搜索", style: TextStyle(fontSize: 15, color: Colors.grey),)
,              ],
            )
          ],
        ),
      ),
    );
  }
}
