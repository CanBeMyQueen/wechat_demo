import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/pages/Friends/friends_index_bar.dart';

import '../discover/discover_child_page.dart';
import 'friends_data.dart';

class _FriendsCell extends StatelessWidget {

  const _FriendsCell({required this.name, this.imageUrl, this.assetImage, this.groupTitle});

  final String name;
  final String? imageUrl;
  final String? assetImage;
  final String? groupTitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          color: WechatThemeColor,
          height: groupTitle != null ? 30 : 0,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(groupTitle != null ? groupTitle! : '', style: const TextStyle(fontSize: 12),),
        ),
        Container(
          color: Colors.white,
          height: 54,
          // padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: imageUrl != null
                        ? DecorationImage(image: NetworkImage(imageUrl!))
                        : DecorationImage(image: AssetImage(assetImage!))

                ),
              ),

              Container(
                width: screenWidth(context) - 54,
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 44,
                      child: Text(name, style: const TextStyle(fontSize: 18),),
                    ),
                    Container(
                      color: WechatThemeColor,
                      height: 0.5,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> with AutomaticKeepAliveClientMixin<FriendsPage> {

  Widget _itemForRow(BuildContext context, int index) {

    if (index < headersData.length) {
      return _FriendsCell(name: headersData[index].name, assetImage: headersData[index].assetImage,);
    }

    bool _hiddenIndexLetter = (index - 4 > 0 &&
        _listDatas[index - 4].indexLetter == _listDatas[index - 5].indexLetter);

    return _FriendsCell(
      name: _listDatas[index - headersData.length].name,
      imageUrl: _listDatas[index - headersData.length].imageUrl,
      groupTitle: _hiddenIndexLetter != true ? _listDatas[index - headersData.length].indexLetter : null,);
  }
  final List <Friends> _listDatas = [];
  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };
  final double _cellHeight = 54.0;
  final double _groupHeight = 30.0;
  var _groupOffset = 54.0 * 4;

  late ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _listDatas..addAll(datas)..addAll(datas);
    _listDatas.sort((Friends a, Friends b) {
        return a.indexLetter!.compareTo(b.indexLetter!);
    });

    for (int i = 0; i < _listDatas.length; i++) {
      if (i == 0) {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += _cellHeight + _groupHeight;
      } else if (_listDatas[i].indexLetter == _listDatas[i - 1].indexLetter) {
        _groupOffset += _cellHeight;
      } else {
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += _cellHeight + _groupHeight;
      }
    }

    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => const DiscoverChildPage(title: '添加朋友')
                  )
              );
            },
            child:  Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset('images/icon_friends_add.png', width: 20,),
            ),
          )
        ],
        backgroundColor: WechatThemeColor,
        title: const Text('通讯录'),
        elevation: 0.0,
      ),
      body: Container(
        color: WechatThemeColor,
        child: Stack(
          children: [
            ListView.builder(
              controller: _controller,
              itemBuilder: _itemForRow,
              itemCount: _listDatas.length + headersData.length,
            ),
            IndexBar(indexBarCallBack: (String word) {
              if (_groupOffsetMap[word] != null) {
                _controller.animateTo(_groupOffsetMap[word], duration: const Duration(microseconds: 250), curve: Curves.easeIn);
              }
            }),
         ]
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

