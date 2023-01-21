class InboxItem {
  final String id;
  final String lastMessage;
  final List members;
  final String topic;
  final int modifiedAt;

  InboxItem({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.topic,
    required this.modifiedAt,
  });

  factory InboxItem.fromJson(Map<String, dynamic> json) {
    return InboxItem(
      id: json['id'],
      lastMessage: json['last_message'],
      members: json['members'],
      topic: json['topic'],
      modifiedAt: json['modified_at'],
    );
  }
}
