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
    final newMessage = Message(
      id: '',
      message: stringMessage,
      modifiedAt: 0,
      sender: '',
    );

    final List<Message> messages = await repo.getCurrentMessages();
    messages.add(newMessage);

    emit(
        state.copyWith(messages: messages, status: ConversationStatus.success));
  }
}
