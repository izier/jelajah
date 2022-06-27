import "package:flutter/material.dart";
import 'package:jelajah/presentation/pages/welcome_page.dart';

Widget home = const WelcomePage();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelajah',
      theme: ThemeData(
        primaryColor: const Color(0xFF2F80ED),
      ),
      home: home,
    );
  }
}
