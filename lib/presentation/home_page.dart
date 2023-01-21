import 'package:chatty/presentation/views/conversation_view.dart';
import 'package:chatty/presentation/views/inbox_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Row(
            children: const [
              InboxView(),
              ConversationView(),
            ],
          ),
        ),
      ),
    );
  }
}
