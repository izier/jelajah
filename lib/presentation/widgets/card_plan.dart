import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/presentation/pages/plan_detail_page.dart';

class CardPlan extends StatelessWidget {
  final PlanModel plan;

  const CardPlan({Key? key, required this.plan}) : super(key: key);

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
                child: Text(
                  '0/' + plan.missions.length.toString(),
                  style: fontStyle.bodyText1,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                plan.name,
                style: fontStyle.bodyText1,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlanDetailPage(
              planDetail: plan,
            ),
          ),
        );
      },
    );
  }
}
