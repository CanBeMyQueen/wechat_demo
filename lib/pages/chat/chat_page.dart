import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/main.dart';
import 'package:http/http.dart' as http;

import 'chat_data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin<ChatPage> {



  List <ChatModel> _chatList = [];
  bool _networkFailed = false;
  String _stateStr = 'loading...';

  Widget _buildPopupMenuItem(String imgAss, String title) {
    return Row(
      children: [
        Image(image: AssetImage(imgAss), width: 20,),
        SizedBox(width: 20,),
        Text(title, style: TextStyle(color: Colors.white),),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getChatData().then((datas){
      print(datas);
      if (!_networkFailed) {
        setState(() {
          _chatList = datas;
        });
      }
    }).catchError((e) {
      _networkFailed = true;
    }).whenComplete(() {
      print('请求加载完成');
    }).timeout(const Duration(seconds: 3)).catchError((e){
      _networkFailed = true;
      setState(() {
        _stateStr = '请求超时，请稍后重新尝试';
      });
    });
  }

   Future<List<ChatModel>> _getChatData() async {
     _networkFailed = false;
     setState(() {
       _stateStr = 'loading...';
     });
    Uri uri = Uri.parse('http://rap2api.taobao.org/app/mock/256798/api/chat/list');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final chatMap = json.decode(response.body);
      List <ChatModel> chatList = chatMap['chat_list']
          .map<ChatModel>((item) => ChatModel.fromMap(item))
          .toList();
      return chatList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WechatThemeColor,
        centerTitle: true,
        title: const Text('微信'),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton(
                color: const Color.fromRGBO(51, 51, 51, 1.0),
                offset: const Offset(0, 58),
                child: const Image(image: AssetImage('images/圆加.png'),width: 25,),
                itemBuilder: (BuildContext context){
                  return [
                    PopupMenuItem(
                        child: _buildPopupMenuItem('images/发起群聊.png', '发起群聊')),
                    PopupMenuItem(
                        child: _buildPopupMenuItem('images/添加朋友.png', '添加朋友')),
                    PopupMenuItem(
                        child: _buildPopupMenuItem('images/扫一扫1.png', '扫一扫')),
                    PopupMenuItem(
                        child: _buildPopupMenuItem('images/收付款.png', '收付款')),
                  ];
                }),
          )
        ],
      ),
      body: Container(
        child: _chatList.length == 0
            ? Center(child: Text(_stateStr),)
            : ListView.builder(itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_chatList[index].name
                ),
                subtitle: Container(
                  height: 25,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(right: 10,),
                  child: Text(_chatList[index].message, overflow: TextOverflow.ellipsis,),
                ),
                leading: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(image: NetworkImage(_chatList[index].imageUrl))
                  ),
                ),
              );
        }, itemCount: _chatList.length,),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
