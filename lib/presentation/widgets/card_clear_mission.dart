import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/pages/plan_detail_page.dart';

import '../../domain/entity/mission.dart';
import '../../domain/entity/place.dart';
import '../../domain/entity/plan.dart';
import '../../domain/entity/plan_detail.dart';

class CardClearMission extends StatefulWidget {
  final Plan plan;

  static const colorBiru = Color(0xff2F80ED);
  static const colorMerah = Color(0xffED1C24);

  const CardClearMission({Key? key, required this.plan}) : super(key: key);

  @override
  State<CardClearMission> createState() => _CardClearMissionState();
}

class _CardClearMissionState extends State<CardClearMission> {
  PlanDetail planDetail = const PlanDetail(
      id: '2',
      name: 'Yogyakarta culinary plan',
      category: 1,
      description: 'lorem',
      missionList: [
        Mission(id: '1', name: 'testing misi', planName: 'aaa', planId: '1')
      ],
      placeList: [
        Place(
            id: '1',
            name: 'Yogyakarta',
            coverImage:
                'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
      ],
      status: false);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 8),
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(
                color: CardClearMission.colorBiru,
                style: BorderStyle.solid,
                width: 2.0,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: CardClearMission.colorBiru.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 4))
              ]),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                          '1/' + planDetail.missionList.length.toString(),
                          style: fontStyle.bodyText1))),
              Expanded(
                  flex: 4,
                  child: Text(widget.plan.name, style: fontStyle.bodyText1))
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlanDetailPage(planDetail: planDetail)),
          );
        });
  }
}
