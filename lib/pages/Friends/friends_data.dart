
import 'package:flutter/material.dart';

class Friends  {

  const Friends({required this.name, this.imageUrl, this.indexLetter, this.assetImage});

  final String name;
  final String? imageUrl;
  final String? assetImage;
  final String? indexLetter;

}

List <Friends> headersData = [
  const Friends(assetImage: 'images/新的朋友.png', name: '新的朋友'),
  const Friends(assetImage: 'images/群聊.png', name: '群聊'),
  const Friends(assetImage: 'images/标签.png', name: '标签'),
  const Friends(assetImage: 'images/公众号.png', name: '公众号'),
];



List <Friends>datas = [
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/27.jpg',
      name: 'Lina',
      indexLetter: 'L'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: '菲儿',
      indexLetter: 'F'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/16.jpg',
      name: '安莉',
      indexLetter: 'A'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/31.jpg',
      name: '阿贵',
      indexLetter: 'A'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/22.jpg',
      name: '贝拉',
      indexLetter: 'B'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/37.jpg',
      name: 'Lina',
      indexLetter: 'L'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/18.jpg',
      name: 'Nancy',
      indexLetter: 'N'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/47.jpg',
      name: '扣扣',
      indexLetter: 'K'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      name: 'Jack',
      indexLetter: 'J'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
      name: 'Emma',
      indexLetter: 'E'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/24.jpg',
      name: 'Abby',
      indexLetter: 'A'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/15.jpg',
      name: 'Betty',
      indexLetter: 'B'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg',
      name: 'Tony',
      indexLetter: 'T'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/26.jpg',
      name: 'Jerry',
      indexLetter: 'J'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/men/36.jpg',
      name: 'Colin',
      indexLetter: 'C'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
      name: 'Haha',
      indexLetter: 'H'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/11.jpg',
      name: 'Ketty',
      indexLetter: 'K'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/13.jpg',
      name: 'Lina',
      indexLetter: 'L'
  ),
  const Friends(
      imageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
      name: 'Lina',
      indexLetter: 'L'
  ),


];

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
