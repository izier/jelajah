import 'package:flutter/material.dart';
import 'package:jelajah/common/constants.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/service/shared_preference_service.dart';
import 'package:jelajah/domain/entity/login.dart';
import 'package:jelajah/presentation/blocs/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/presentation/pages/main_page.dart';
import 'package:jelajah/presentation/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Image.asset('assets/images/logo_text.png', width: 96),
          elevation: 0,
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state is LoginLoading) {
              const SnackBar snackBar = SnackBar(
                content: Text('Masuk ke akun...'),
                backgroundColor: Colors.grey,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state is LoginSuccess) {
              const SnackBar snackBar = SnackBar(
                content: Text('Berhasil masuk'),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              final prefs = SharedPreferenceService();
              prefs.setUserSession(state.user.id);
              prefs.setAuthenticated(true);
              Constant.user = state.user;
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                  (route) => false);
            } else if (state is LoginFailed) {
              SnackBar snackBar = SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Container(
            height: screenHeight,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Masuk', style: fontStyle.headline1),
                      Text('Masuk ke dalam akun penjelajah kamu',
                          style: fontStyle.bodyText1),
                      const SizedBox(height: 40),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: fontStyle.bodyText1),
                        controller: usernameController,
                        validator: (username) {
                          if (username == null || username.isEmpty) {
                            return 'Username wajib diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: fontStyle.bodyText1,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            child: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        controller: passwordController,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Password wajib diisi';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: Text('Masuk', style: fontStyle.button),
                      style: primaryButton,
                      onPressed: () {
                        setState(() {
                          _passwordVisible = false;
                        });
                        if (_formKey.currentState!.validate()) {
                          _loginBloc.add(LoginUserEvent(Login(
                            username: usernameController.text,
                            password: passwordController.text,
                          )));
                        } else {
                          const snackBar = SnackBar(
                            content:
                                Text('Pastikan data telah terisi dengan benar'),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Belum punya akun?', style: fontStyle.bodyText1),
                        TextButton(
                          child: Text('Daftar', style: fontStyle.bodyText2),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
