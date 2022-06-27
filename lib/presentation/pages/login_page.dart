import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/pages/main_page.dart';
import 'package:jelajah/presentation/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Image.asset('assets/images/logo_text.png', width: 96),
        elevation: 0,
      ),
      body: Container(
        height: screenHeight,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Masuk', style: fontStyle.headline1),
                Text('Masuk ke dalam akun penjelajah kamu',
                    style: fontStyle.bodyText1),
                const SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Username', labelStyle: fontStyle.bodyText1),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: fontStyle.bodyText1,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  child: Text('Masuk', style: fontStyle.button),
                  style: primaryButton,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
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
                                builder: (context) => const RegisterPage()));
                      },
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
