import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/pages/login_page.dart';
import 'package:jelajah/presentation/pages/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: screenHeight,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
                child: Image.asset('assets/images/logo.png',
                    width: screenWidth / 4)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: screenHeight / 3),
                  child: Center(
                    child: Image.asset('assets/images/welcome_banner.png'),
                  ),
                ),
                Text(
                  'Mulai berjelajah!',
                  textAlign: TextAlign.start,
                  style: fontStyle.headline1,
                ),
                Text(
                    'Selesaikan misi, terus bereksplorasi, dan jadilah penjelajah sejati!',
                    style: fontStyle.bodyText1),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text('Daftar', style: fontStyle.button),
                  style: primaryButton,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  child: Text('Masuk', style: fontStyle.button),
                  style: secondaryButton,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
