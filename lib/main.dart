import "package:flutter/material.dart";
<<<<<<< HEAD
import 'package:jelajah/presentation/pages/welcome_page.dart';
=======
import 'package:jelajah/presentation/pages/main_page.dart';
>>>>>>> ad7f5797c2e087bf99e45bf35732c3dc08e10f44

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelajah',
      theme: ThemeData(
        primaryColor: const Color(0xFF2F80ED),
      ),
      home: WelcomePage(),
    );
  }
}
