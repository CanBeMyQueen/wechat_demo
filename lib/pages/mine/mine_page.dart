
import 'package:flutter/material.dart';
import 'package:wechat_demo/cell_line.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/pages/discover/discover_cell.dart';

import '../discover/discover_child_page.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: MineViewPage(context: context,),
    );
  }
}

class MineViewPage extends StatelessWidget {

  BuildContext context;
  MineViewPage({required this.context});

  Widget _mineHeaderView() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => const DiscoverChildPage(title:'个人中心')
            )
        );
      },
      child: Container(
        color: Colors.white,
        height: 200,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(top: 100, left: 20, right: 10, bottom: 10),
          child: Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage('images/Hank.png')
                    )
                ),
              ),
              Container(
                width: screenWidth(context) - 105,
                margin: const EdgeInsets.only(top: 15, left: 10, bottom: 20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hank',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('微信号：hank1234',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey
                          ),),
                        Image(image: AssetImage('images/icon_right.png'), width: 15,)

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 240, 240, 1.0),
      child: Stack(
        children: [
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  _mineHeaderView(),
                  Container(height: 10,),
                  DiscoverCell(title: '支付', imageName: 'images/微信 支付.png'),
                  Container(height: 10,),
                  DiscoverCell(title: '收藏', imageName: 'images/微信收藏.png'),
                  CellLine(),
                  DiscoverCell(title: '相册', imageName: 'images/微信相册.png'),
                  CellLine(),
                  DiscoverCell(title: '卡包', imageName: 'images/微信卡包.png'),
                  CellLine(),
                  DiscoverCell(title: '表情', imageName: 'images/微信表情.png'),
                  Container(height: 10,),
                  DiscoverCell(title: '设置', imageName: 'images/微信设置.png'),
                ],
              )
          ),
          Positioned(
            right: 10,
            top: 60,
            child: Image.asset('images/相机.png', width: 20,),
          )
        ],
      ),
    );
  }
}

