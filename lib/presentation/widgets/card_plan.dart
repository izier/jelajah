import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/plan.dart';

class CardPlan extends StatelessWidget {
  Plan plan;
  CardPlan({
    required this.plan
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
              child: Center(child: Text('0/' + plan.missionList.length.toString(), style: fontStyle.bodyText1))),
            Expanded(
              flex: 4,
              child: Text(plan.name, style: fontStyle.bodyText1))
          ],
        ),
      ),
    );
  }
}
