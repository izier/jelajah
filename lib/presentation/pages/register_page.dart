import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/register_model.dart';
import 'package:jelajah/presentation/blocs/register/register_bloc.dart';
import 'package:jelajah/presentation/pages/login_page.dart';

final _formKey = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  late RegisterBloc _registerBloc;
  final usernameController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _registerBloc = context.read<RegisterBloc>();
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
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            const SnackBar snackBar = SnackBar(
              content: Text(
                'Akun telah didaftarkan, silakan masuk menggunakan akun baru Anda',
              ),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is RegisterFailed) {
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
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              if (state is RegisterLoading) {
                return const CircularProgressIndicator();
              } else if (state is RegisterSuccess) {
                return const Text('Duir');
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daftar',
                            style: fontStyle.headline1,
                          ),
                          Text(
                            'Daftarkan akun penjelajah kamu',
                            style: fontStyle.bodyText1,
                          ),
                          const SizedBox(height: 40),
                          TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Nama lengkap',
                                labelStyle: fontStyle.bodyText1,
                              ),
                              controller: fullnameController,
                              validator: (fullname) {
                                if (fullname == null || fullname.isEmpty) {
                                  return 'Nama lengkap wajib diisi';
                                }
                                return null;
                              }),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: fontStyle.bodyText1,
                            ),
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
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: fontStyle.bodyText1,
                            ),
                            controller: passwordController,
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'Password wajib diisi';
                              } else if (password.length < 8) {
                                return 'Panjang password tidak boleh kurang dari 8 karakter';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Konfirmasi password',
                              labelStyle: fontStyle.bodyText1,
                            ),
                            controller: confirmPasswordController,
                            validator: (confirmPassword) {
                              if (confirmPassword == null ||
                                  confirmPassword.isEmpty) {
                                return 'Konfirmasi password wajib diisi';
                              } else if (!(confirmPassword ==
                                  passwordController.text)) {
                                return 'Konfirmasi password wajib sama dengan password';
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
                          child: Text(
                            'Daftar',
                            style: fontStyle.button,
                          ),
                          style: primaryButton,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              RegisterModel user = RegisterModel(
                                fullname: fullnameController.text,
                                username: usernameController.text,
                                password: passwordController.text,
                              );
                              _registerBloc.add(RegisterUserEvent(user: user));
                            } else {
                              const snackBar = SnackBar(
                                content: Text(
                                    'Pastikan data telah terisi dengan benar'),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun?',
                              style: fontStyle.bodyText1,
                            ),
                            TextButton(
                              child: Text(
                                'Masuk',
                                style: fontStyle.bodyText2,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
