import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/mission.dart';
import 'package:jelajah/presentation/pages/camera_page.dart';

class CardMission extends StatefulWidget {
  final MissionModel mission;
  final int index;
  final String iconUrl;

  const CardMission({
    Key? key,
    required this.mission,
    required this.index,
    required this.iconUrl,
  }) : super(key: key);

  @override
  State<CardMission> createState() => _CardMissionState();
}

class _CardMissionState extends State<CardMission> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 8),
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text((widget.index + 1).toString() + '. ',
                    style: fontStyle.bodyText1),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(widget.mission.name, style: fontStyle.bodyText1),
            ),
            const Expanded(
              flex: 1,
              child: Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
      onTap: () async {
        await availableCameras().then((value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraPage(
                iconUrl: widget.iconUrl,
                mission: widget.mission,
                camera: value.first,
              ),
            )));
      },
    );
  }
}
