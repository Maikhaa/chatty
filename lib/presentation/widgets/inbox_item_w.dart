import 'package:chatty/domain/inbox_item.dart';
import 'package:flutter/material.dart';

class InboxItemW extends StatelessWidget {
  final InboxItem inboxItem;

  const InboxItemW({required this.inboxItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(inboxItem.topic),
      subtitle: Text(inboxItem.lastMessage),
    );
  }
}
