import 'package:chatty/domain/inbox_item.dart';
import 'package:flutter/material.dart';

class InboxItemW extends StatelessWidget {
  final InboxItem inboxItem;
  final Function onTap;

  const InboxItemW({required this.inboxItem, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.add),
      title: Text(inboxItem.topic),
      subtitle: Text(inboxItem.lastMessage),
      onTap: () {
        onTap();
      },
    );
  }
}
