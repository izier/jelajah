import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/presentation/blocs/register/register_bloc.dart';
import 'package:jelajah/presentation/blocs/login/login_bloc.dart';
import 'package:jelajah/presentation/pages/welcome_page.dart';
import 'package:jelajah/injection.dart' as di;

Widget home = const WelcomePage();

void main() {
  di.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<RegisterBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<LoginBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Jelajah',
        theme: ThemeData(
          primaryColor: const Color(0xFF2F80ED),
        ),
        home: home,
      ),
    );
  }
}
