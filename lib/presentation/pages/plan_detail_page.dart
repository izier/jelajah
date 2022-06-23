import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/plan_detail.dart';
import 'package:jelajah/presentation/widgets/card_mission.dart';
import 'package:jelajah/presentation/widgets/card_place.dart';

class PlanDetailPage extends StatelessWidget {
  PlanDetail planDetail;

  PlanDetailPage({required this.planDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 4, child: Text(planDetail.name, style: fontStyle.headline1)),
                  Expanded(flex: 1, child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png')),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text('0 dari ' + planDetail.missionList.length.toString() + ' telah selesai'),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planDetail.description, style: fontStyle.bodyText1),
                  SizedBox(height: 16),
                  Text('Daftar misi', style: fontStyle.headline2),
                  SizedBox(height: 8),
                  Container(
                    height: 48 * planDetail.missionList.length.toDouble(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: planDetail.missionList.length,
                      itemBuilder: (context, index) {
                        return CardMission(mission: planDetail.missionList[index], index: index);
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Tempat wisata', style: fontStyle.headline2),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: planDetail.placeList.length,
                itemBuilder: (context, index) {
                  return CardPlace(place: planDetail.placeList[index], index: index, length: planDetail.placeList.length);
                },
              ),
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}