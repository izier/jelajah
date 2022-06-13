import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/mission.dart';
import 'package:jelajah/models/place.dart';
import 'package:jelajah/models/plan.dart';
import 'package:jelajah/models/plan_detail.dart';
import 'package:jelajah/presentation/pages/plan_detail_page.dart';

class CardPlan extends StatelessWidget {
  Plan plan;

  CardPlan({
    required this.plan
  });

  PlanDetail planDetail = new PlanDetail(id: '2', name: 'Yogyakarta culinary plan', category: 1, description: 'lorem', missionList: [new Mission(id: '1', name: 'testing misi')], placeList: [new Place(id: '1', name: 'Yogyakarta', coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')], status: false);
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
              child: Center(child: Text('0/' + planDetail.missionList.length.toString(), style: fontStyle.bodyText1))),
            Expanded(
              flex: 4,
              child: Text(plan.name, style: fontStyle.bodyText1))
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlanDetailPage(planDetail: planDetail)),
        );
      }
    );
  }
}
