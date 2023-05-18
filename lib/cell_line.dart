import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';

class CellLine extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(width: 50, color: Colors.white, height: 0.7,),
          Container(color: WechatThemeColor, height: 0.7,)
        ],
      ),
    );
  }
}
