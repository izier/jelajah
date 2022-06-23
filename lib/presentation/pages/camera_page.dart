import 'package:flutter/material.dart';

import 'package:jelajah/models/mission.dart';
import 'package:jelajah/presentation/pages/confirmation_page.dart';

class CameraPage extends StatelessWidget {
  Mission mission;

  CameraPage({required this.mission});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text('Send'),
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => ConfirmationPage(mission: mission))
            );
          },
        ),
      ),
    );
  }
}
