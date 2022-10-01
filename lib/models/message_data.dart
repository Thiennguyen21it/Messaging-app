import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class MessageData {
  const MessageData({
    required this.senderName,
    required this.message,
    required this.profilePicture,
    required this.messageDate,
    required this.dateMessage,
  });

  final String senderName;
  final String message;
  final DateTime messageDate;
  final String dateMessage;
  final String profilePicture;
}
