import 'dart:convert';

import 'package:chatty/domain/inbox_item.dart';

class InboxResponse {
  final String inboxResponseString;

  InboxResponse(this.inboxResponseString);

  List<InboxItem> getInboxItems() {
    var inboxItemsString =
        '${inboxResponseString.substring(0, inboxResponseString.length - 3)}]';

    List<InboxItem> inboxItems = (jsonDecode(inboxItemsString) as List)
        .map((i) => InboxItem.fromJson(i))
        .toList();

    return inboxItems;
  }
}
