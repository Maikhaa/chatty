import 'dart:convert';

import 'package:chatty/domain/message.dart';

class ConversationResponse {
  final String responseString;

  ConversationResponse(this.responseString);

  List<Message> getMessages() {
    var conversationString =
        '${responseString.substring(0, responseString.length - 2)}]';

    List<Message> messages = (jsonDecode(conversationString) as List)
        .map((i) => Message.fromJson(i))
        .toList();

    return messages;
  }
}
