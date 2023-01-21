import 'package:chatty/data/repository.dart';
import 'package:chatty/data/responses/conversation_response.dart';
import 'package:chatty/data/utils/types.dart';
import 'package:chatty/domain/message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'conversation_state.dart';

class ConversationCubit extends Cubit<ConversationState> {
  final Repository repo;

  ConversationCubit(this.repo) : super(const ConversationState());

  void fetchConversation(String id) async {
    final ApiResponse<ConversationResponse> failureOrResponse =
        await repo.fetchConversation(id);

    failureOrResponse.fold(
        (failure) => emit(state.copyWith(status: ConversationStatus.loading)),
        (response) async {
      final List<Message> messages = response.getMessages();

      emit(state.copyWith(
          messages: messages, status: ConversationStatus.success));
    });
  }

  void sendMessage(String stringMessage) async {
    if (stringMessage.isNotEmpty) {
      final newMessage = Message(
        id: '',
        message: stringMessage,
        modifiedAt: 0,
        sender: 'Me',
      );

      final List<Message> messages = await repo.getCurrentMessages();
      messages.add(newMessage);

      emit(state.copyWith(
          messages: messages, status: ConversationStatus.success));
      Future.delayed(const Duration(seconds: 2), () {
        _generateResponseMessage();
      });
    }
  }

  void _generateResponseMessage() async {
    final List<Message> messages = state.messages ?? [];
    final String sender = messages[0].sender;

    final responseMessage = Message(
      id: '',
      message: 'OK, that sounds great.',
      modifiedAt: 0,
      sender: sender,
    );

    messages.add(responseMessage);

    emit(
        state.copyWith(messages: messages, status: ConversationStatus.updated));
  }
}
