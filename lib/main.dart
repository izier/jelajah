import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/common/constants.dart';
import 'package:jelajah/data/service/shared_preference_service.dart';
import 'package:jelajah/presentation/blocs/city/city_bloc.dart';
import 'package:jelajah/presentation/blocs/place/place_bloc.dart';
import 'package:jelajah/presentation/blocs/register/register_bloc.dart';
import 'package:jelajah/presentation/blocs/login/login_bloc.dart';
import 'package:jelajah/presentation/blocs/user/user_bloc.dart';
import 'package:jelajah/presentation/pages/main_page.dart';
import 'package:jelajah/presentation/pages/welcome_page.dart';
import 'package:jelajah/injection.dart' as di;

Widget home = const WelcomePage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = SharedPreferenceService();
  Constant.userSession = await prefs.userSession;

  home = Constant.userSession != 0 ? const MainPage() : const WelcomePage();
  Constant.userSession = await prefs.userSession;

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
        BlocProvider(
          create: (_) => di.locator<UserBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<CityBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PlaceBloc>(),
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
