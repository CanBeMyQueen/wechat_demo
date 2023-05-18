import 'package:flutter/material.dart';

class ChatModel {

    final String name;
    final String imageUrl;
    final String message;

    ChatModel({required this.name, required this.imageUrl, required this.message});

    factory ChatModel.fromMap(Map map) {
      return ChatModel(
          name: map['name'],
          imageUrl: map['imageUrl'],
          message: map['message']);
    }

}