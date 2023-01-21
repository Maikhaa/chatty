import 'package:chatty/domain/message.dart';
import 'package:flutter/material.dart';

class MessageW extends StatelessWidget {
  final Message message;

  const MessageW({required this.message,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(message.message),
    );
  }
}
