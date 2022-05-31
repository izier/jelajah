import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/login_page.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset('assets/images/logo_text.png', width: 96),
        elevation: 0,
      ),
      body: Container(
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daftar', style: fontStyle.headline1),
                  Text('Daftarkan akun penjelajah kamu', style: fontStyle.bodyText1),
                  SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Nama lengkap',
                        labelStyle: fontStyle.bodyText1
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: fontStyle.bodyText1
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: fontStyle.bodyText1,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Konfirmasi password',
                      labelStyle: fontStyle.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    child: Text('Daftar', style: fontStyle.button),
                    style: primaryButton,
                    onPressed: (){},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sudah punya akun?', style: fontStyle.bodyText1),
                      TextButton(
                        child: Text('Masuk', style: fontStyle.bodyText2),
                        onPressed: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginPage())
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}