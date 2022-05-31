import "package:flutter/material.dart";
import 'package:jelajah/presentation/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelajah',
      home: WelcomePage(),
    );
  }
}