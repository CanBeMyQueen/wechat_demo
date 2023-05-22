import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';

import 'chat_data.dart';
class SearchPage extends StatefulWidget {

  final List<ChatModel> datas;

  const SearchPage({required this.datas});


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ChatModel> _searchDatas = [];
  String _searchText = '';
  _searchData(String text) {
    print('接收到了：' + text);
    _searchText = text;
    _searchDatas.clear();
    if (text.length > 0) {

      for (int i = 0; i < widget.datas.length; i++) {
        String name = widget.datas[i].name;
        if (name.contains(text)) {
          _searchDatas.add(widget.datas[i]);
        }

      }
    }
    setState(() {

    });
  }

  final TextStyle _normalStyle = TextStyle(
    color: Colors.black ,
    fontSize: 16
  );
  
  final TextStyle _highlightStyle = TextStyle(
    color: Colors.green,
      fontSize:16
  );
  
  Widget _itemTitleForRow(String name) {

    List <TextSpan> _spans = [];
    List <String>strings = name.split(_searchText);
    for (int i = 0; i < strings.length; i++) {
      String str = strings[i];
      if (str == '' && i < strings.length - 1) {
        _spans.add(TextSpan(text: _searchText, style: _highlightStyle));
      } else {
        _spans.add(TextSpan(text: strings[i], style: _normalStyle));
        if (i < strings.length - 1) {
          _spans.add(TextSpan(text: _searchText, style: _highlightStyle));
        }
      }
    }

    return RichText(text: TextSpan(children: _spans));
  }

  Widget? _itemBuilderForRow(BuildContext context, int index) {


    return ListTile(
      title: _itemTitleForRow(_searchDatas[index].name),
      subtitle: Container(
        height: 25,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(right: 10,),
        child: Text(_searchDatas[index].message, overflow: TextOverflow.ellipsis,),
      ),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(image: NetworkImage(_searchDatas[index].imageUrl))
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(onChanged: (text){
            _searchData(text);
          },),// 顶部搜索条
          Expanded(child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
              itemCount: _searchDatas.length,
              itemBuilder: _itemBuilderForRow)))
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  const SearchBar({this.onChanged});
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {


  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;
   _onChanged(String text) {
     // print('输入值：' + text);
     if (widget.onChanged != null) {
       widget.onChanged!(text);
     }
     _showClear = (text.length > 0);
     setState(() {

     });
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: WechatThemeColor,
      child: Column(
        children: [
          const SizedBox(height: 53,),
          Container(
            height: 40,
            child: Row(
              children: [
                Container(
                  width: screenWidth(context) - 50,
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  padding: const EdgeInsets.only(left:5, right:5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Image(image: AssetImage('images/放大镜b.png'), width: 20, color: Colors.grey,),// search Image
                      Expanded(child: TextField(
                        onChanged: _onChanged,
                        controller: _controller,
                        autofocus: true,
                        cursorColor: Colors.green,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                        decoration: const InputDecoration(
                          hintText: '搜索',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5, bottom: 5)
                        ),
                      )),// 输入框
                      if (_showClear) GestureDetector(
                        onTap: () {
                          _controller.clear();
                          _onChanged('');
                        },
                        child: Icon(Icons.cancel, size: 20, color: Colors.grey,),
                      ),// 清空图标
                    ],
                  ),
                ),// 搜索框背景
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("取消", style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                  ),) ,
                )
                // 取消按钮

              ],
            ),
          )
        ],
      ),
    );
  }
}
