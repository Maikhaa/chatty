part of 'conversation_cubit.dart';

enum ConversationStatus { initial, loading, success, updated, error }

class ConversationState extends Equatable {
  final List<Message>? messages;
  final ConversationStatus status;

  const ConversationState(
      {this.messages, this.status = ConversationStatus.initial});

  ConversationState copyWith({
    List<Message>? messages,
    ConversationStatus? status,
  }) =>
      ConversationState(
        messages: messages ?? this.messages,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [messages, status];
}
