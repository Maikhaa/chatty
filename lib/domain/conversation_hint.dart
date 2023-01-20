class ConversationHint {
  final String id;
  final String lastMessage;
  final List members;
  final String topic;
  final int modifiedAt;

  ConversationHint({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.topic,
    required this.modifiedAt,
  });
}
