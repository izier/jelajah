import "package:flutter/material.dart";
import 'package:jelajah/presentation/pages/confirmation_page.dart';
import 'package:jelajah/presentation/pages/main_page.dart';
import 'package:jelajah/presentation/pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelajah',
      theme: ThemeData(
        primaryColor: Color(0xFF2F80ED),
      ),
      home: MainPage(),
    );
  }
}