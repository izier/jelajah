import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/mission.dart';

class CardMission extends StatelessWidget {
  Mission mission;
  int index;

  CardMission({
    required this.mission,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 8),
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: Offset(0, 4)
            )]
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Center(child: Text((index + 1).toString() + '. ', style: fontStyle.bodyText1))),
            Expanded(
                flex: 6,
                child: Text(mission.name, style: fontStyle.bodyText1)),
            Expanded(
                flex: 1,
                child: Icon(Icons.photo_camera)
            ),
          ],
        ),
      ),
    );
  }
}
