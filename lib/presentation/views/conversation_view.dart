import 'package:chatty/presentation/logic/conversation/conversation_cubit.dart';
import 'package:chatty/presentation/widgets/message_w.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final width = kIsWeb ? screenWidth * 0.7 : screenWidth * 0.9;
    final height = kIsWeb ? screenHeight * 0.9 : screenHeight * 0.8;

    Widget conversation(ConversationState state) {
      final messages = state.messages;

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: messages!.length,
          itemBuilder: (context, index) => MessageW(
            message: messages[index],
          ),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: BlocBuilder<ConversationCubit, ConversationState>(
        bloc: BlocProvider.of<ConversationCubit>(context),
        builder: (context, state) {
          switch (state.status) {
            case ConversationStatus.initial:
              return initial();
            case ConversationStatus.success:
            case ConversationStatus.updated:
              return conversation(state);
            default:
              return loading();
          }
        },
      ),
    );
  }

  Widget initial() {
    return Container();
  }

  Widget loading() => const Center(child: CircularProgressIndicator());
}
