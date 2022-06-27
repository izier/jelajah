import 'package:flutter/material.dart';
import 'package:jelajah/domain/entity/mission.dart';

import 'package:jelajah/presentation/pages/confirmation_page.dart';

class CameraPage extends StatelessWidget {
  final Mission mission;

  const CameraPage({Key? key, required this.mission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('Send'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmationPage(mission: mission),
              ),
            );
          },
        ),
      ),
    );
  }
}
