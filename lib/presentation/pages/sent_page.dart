import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';

class SentPage extends StatelessWidget {
  const SentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Foto terkirim', style: fontStyle.headline1),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/sent_banner.png'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tunggu konfirmasi validasi foto dari kami (sekitar 1 - 2 jam setelah pengiriman).',
                    style: fontStyle.caption,
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Kembali ke Plan', style: fontStyle.button),
              style: primaryButton,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
