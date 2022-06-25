import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/domain/entity/mission.dart';
import 'package:jelajah/presentation/pages/camera_page.dart';

class CardMission extends StatelessWidget {
  final Mission mission;
  final int index;

  const CardMission({
    Key? key,
    required this.mission,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 8),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 4))
              ]),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text((index + 1).toString() + '. ',
                      style: fontStyle.bodyText1),
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(mission.name, style: fontStyle.bodyText1),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.photo_camera,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraPage(mission: mission),
            ),
          );
        });
  }
}
