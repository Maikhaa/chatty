import 'package:chatty/presentation/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Chatty());
}

class Chatty extends StatelessWidget {
  const Chatty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Chatty'),
    );
  }
}
