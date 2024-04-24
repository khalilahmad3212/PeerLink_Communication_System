import 'package:flutter/material.dart';

class ChatTileModel {
  String name;
  String profilePicturePath;
  String lastMessage;

  ChatTileModel({
    required this.name,
    required this.lastMessage,
    required this.profilePicturePath,
  });
}
