import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/domain/entity/mission.dart';
import 'package:jelajah/presentation/pages/sent_page.dart';

class ConfirmationPage extends StatelessWidget {
  final Mission mission;

  const ConfirmationPage({Key? key, required this.mission}) : super(key: key);

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
          children: [
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Text(mission.planName, style: fontStyle.headline1)),
                const SizedBox(width: 16),
                Expanded(
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png'))
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Foto', style: fontStyle.headline2),
                      Text(mission.name, style: fontStyle.headline2)
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width - 48,
                          fit: BoxFit.cover)),
                  const SizedBox(height: 8),
                  Text(
                      'Pastikan bahwa objek yang difoto telah sesuai dengan misi yang akan diselesaikan dan dapat terlihat dengan jelas.',
                      style: fontStyle.caption)
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  child: Text('Ganti foto', style: fontStyle.button),
                  style: secondaryButton,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  child: Text('Kirim', style: fontStyle.button),
                  style: primaryButton,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SentPage()));
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
