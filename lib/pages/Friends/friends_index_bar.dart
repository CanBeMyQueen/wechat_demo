import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/pages/Friends/friends_data.dart';

class IndexBar extends StatefulWidget {

  final void Function(String word) indexBarCallBack;
  const IndexBar({required this.indexBarCallBack});

  @override
  State<IndexBar> createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {

  Color _bgColor = const Color.fromRGBO(0, 0, 0, 0.0);
  Color _textColor = Colors.black;
  int _currentIndex = -1;
  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indecatorHidden = false;


  int _getIndex(BuildContext context, Offset position) {
    RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null) return 0;
    double offsetY = box!.globalToLocal(position).dy;
    double itemHeight = screenHeight(context) / 2 / INDEX_WORDS.length;
    int index = (offsetY ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);
    print("点到了：${INDEX_WORDS[index]}");
    if (_currentIndex != index) {
      widget.indexBarCallBack(INDEX_WORDS[index]);
      setState(() {
        _indicatorY = 2.2 / (INDEX_WORDS.length - 1) * index - 1.1;
        _indicatorText = INDEX_WORDS[index];
        _currentIndex = index;
        _indecatorHidden = true;
      });
    }
    return index;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final List <Widget> _indexes = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      _indexes.add(
        Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15 / 2),
              color: _currentIndex == i ? Colors.green : Color.fromRGBO(0, 0, 0, 0),
            ),
            alignment: Alignment.center,
            child: Text(
              INDEX_WORDS[i],
              style: TextStyle(fontSize: 11, color: _currentIndex == i ? Colors.white : Colors.black,),))
      );
    }
    return Positioned(
        right: 0,
        top: screenHeight(context) / 8,
        width: 115,
        height: screenHeight(context) / 2,
        child: Row(
          children: [
            Container(
              alignment: Alignment(0, _indicatorY),
              width: 100,
              // color: Colors.red,
              child: _indecatorHidden != true ? Stack(
                alignment: Alignment(-0.2, 0),
                children: [
                  const Image(image: AssetImage('images/气泡.png'), width: 60,),
                  Text(_indicatorText, style: const TextStyle(fontSize: 33,color: Colors.white),)
                ],
              ) : null,
            ),
            GestureDetector(
              onVerticalDragDown: (DragDownDetails details) {
                setState(() {
                  _bgColor = const Color.fromRGBO(0, 0, 0, 0.5);
                  _textColor = Colors.white;
                  _indecatorHidden = false;
                });
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                int index = _getIndex(context, details.globalPosition);
              },
              onVerticalDragEnd: (DragEndDetails details) {
                setState(() {
                  _currentIndex = -1;
                  _indecatorHidden = true;
                });
              },
              child: Container(
                // color: _bgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _indexes,
                ),
              ),
            )
          ],
        )
    );
    
  }
}
