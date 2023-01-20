import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
