class Message {
  final String id;
  final String message;
  final int modifiedAt;
  final String sender;

  Message({
    required this.id,
    required this.message,
    required this.modifiedAt,
    required this.sender,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      message: json['message'],
      modifiedAt: json['modified_at'],
      sender: json['sender'],
    );
  }
}
