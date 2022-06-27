import "package:flutter/material.dart";
import 'package:jelajah/data/service/shared_preferences_service.dart';
import 'package:jelajah/presentation/pages/main_page.dart';
import 'package:jelajah/presentation/pages/welcome_page.dart';

Widget home = const WelcomePage();

void main() {
  runApp(MyApp());
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
