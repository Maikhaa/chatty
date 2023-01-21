import 'package:chatty/presentation/logic/conversation/conversation_cubit.dart';
import 'package:chatty/presentation/widgets/message_w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget conversation(ConversationState state) {
      final messages = state.messages;

      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: ListView.builder(
          itemCount: messages!.length,
          itemBuilder: (context, index) => MessageW(
            message: messages[index],
          ),
        ),
      );
    }

    return BlocBuilder<ConversationCubit, ConversationState>(
      bloc: BlocProvider.of<ConversationCubit>(context),
      builder: (context, state) {
        switch (state.status) {
          case ConversationStatus.initial:
            return initial();
          case ConversationStatus.success:
            return conversation(state);
          default:
            return loading();
        }
      },
    );
  }

  Widget initial() {
    return Container();
  }

  Widget loading() => const Center(child: CircularProgressIndicator());
}