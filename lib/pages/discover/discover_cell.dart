import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {

  final String  title;    // 标题
  final String? subTitle; // 副标题
  final String imageName; // 图标
  final bool?   subImage; // 红点
  final bool?   line;     // 分割线
  const DiscoverCell({required this.title, this.subTitle,required this.imageName, this.subImage, this.line})
      : assert(title != null, "title 不可以为空！"), assert(imageName != null, "imageName 不可以为空！");
  @override
  State<StatefulWidget> createState() => _DiscoverCellState();

}

class _DiscoverCellState extends State<DiscoverCell> {

  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("点击了:$widget.title");
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage(title: widget.title)
            )
        );
        setState(() {
          _backgroundColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _backgroundColor = Colors.grey;
        });
      },
      onTapCancel: () {
        setState(() {
          _backgroundColor = Colors.white;
        });
      },


      child: Container(
          height: 55,
          color: _backgroundColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 左视图：图标、title
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Image(image: AssetImage(widget.imageName), width: 20,),
                        const SizedBox(width: 15,),
                        Text(widget.title, style: const TextStyle(fontSize: 15),)
                      ],

                    ),
                  ),
                  // 右视图：subtitle， 红点，箭头
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // subtitle
                        widget.subTitle != null ? Text(widget.subTitle!) : const Text(''),
                        // 红点
                        widget.subImage == true ? const Image(image: AssetImage('images/badge.png'), width: 12,) : Container(),
                        // 箭头
                        Image.asset("images/icon_right.png", width: 15,)
                      ],

                    ),
                  )
                ],
              ),
              widget.line == true ?
              Row(
                children: [
                  Container(width: 50, color: Colors.white, height: 0.5,),
                  Container(color: Colors.grey, height: 0.5,)
                ],
              )
                  : Container()
            ],
          )
      ),
    );

  }
}
