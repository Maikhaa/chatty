import 'package:chatty/presentation/logic/conversation/conversation_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputView extends StatelessWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final width = kIsWeb ? screenWidth * 0.6 : screenWidth * 0.9;
    final height = kIsWeb ? screenHeight * 0.1 : screenHeight * 0.2;

    String text = '';

    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          SizedBox(
            width: kIsWeb ? screenWidth * 0.5 : screenWidth * 0.8,
            child: TextFormField(
              onChanged: (value) {
                text = value;
              },
            ),
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<ConversationCubit>(context).sendMessage(text);
            },
            icon: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
