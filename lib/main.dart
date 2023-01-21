import 'package:chatty/data/repository.dart';
import 'package:chatty/presentation/home.dart';
import 'package:chatty/presentation/logic/conversation/conversation_cubit.dart';
import 'package:chatty/presentation/logic/inbox/inbox_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Chatty());
}

class Chatty extends StatelessWidget {
  const Chatty({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Repository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InboxCubit(repository)),
        BlocProvider(create: (_) => ConversationCubit(repository)),
      ],
      child: const Home(title: 'Chatty'),
    );
  }
}
