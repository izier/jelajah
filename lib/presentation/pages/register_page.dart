import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/domain/entity/register.dart';
import 'package:jelajah/presentation/blocs/register/register_bloc.dart';
import 'package:jelajah/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  late RegisterBloc _registerBloc;
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
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
    final screenHeight = MediaQuery.of(context).size.height;
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
          if (state is RegisterLoading) {
            const SnackBar snackBar = SnackBar(
              content: Text('Mendaftarkan akun...'),
              backgroundColor: Colors.grey,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is RegisterSuccess) {
            const SnackBar snackBar = SnackBar(
              content: Text(
                'Akun telah didaftarkan, silakan masuk ke akun baru Anda',
              ),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
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
          child: Column(
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
                        textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.next,
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
                      obscureText: !_passwordVisible1,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: fontStyle.bodyText1,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible1 = !_passwordVisible1;
                            });
                          },
                          child: Icon(
                            _passwordVisible1
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
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
                      obscureText: !_passwordVisible2,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Konfirmasi password',
                        labelStyle: fontStyle.bodyText1,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible2 = !_passwordVisible2;
                            });
                          },
                          child: Icon(
                            _passwordVisible2
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
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
                      setState(() {
                        _passwordVisible1 = false;
                        _passwordVisible2 = false;
                      });
                      if (_formKey.currentState!.validate()) {
                        _registerBloc.add(RegisterUserEvent(
                          Register(
                            fullname: fullnameController.text,
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        ));
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
          ),
        ),
      ),
    );
  }
}
