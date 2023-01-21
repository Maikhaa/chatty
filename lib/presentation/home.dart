import 'package:chatty/presentation/views/conversation_view.dart';
import 'package:chatty/presentation/views/inbox_view.dart';
import 'package:flutter/material.dart';

import 'views/input_view.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatty',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black54,
              displayColor: Colors.black38,
            ),
      ),
      home: Scaffold(
        backgroundColor: Colors.lightGreen[400],
        body: Center(
          child: Row(
            children: [
              const InboxView(),
              Column(
                children: const [
                  ConversationView(),
                  InputView(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
