import 'package:chatty/data/repository.dart';
import 'package:chatty/presentation/home_page.dart';
import 'package:chatty/presentation/logic/inbox_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Chatty());
}

class Chatty extends StatelessWidget {
  const Chatty({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InboxCubit(Repository()),
      child: const HomePage(title: 'Chatty'),
    );
  }
}
