import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/city.dart';

class CardCity extends StatelessWidget {
  final City city;
  final int index;

  CardCity({required this.city, required this.index});

  @override
  Widget build(BuildContext context) {
    var margin;
    if (index == 0) {
      margin = EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 8);
    } else {
      margin = EdgeInsets.all(8);
    }
    return Container(
      padding: EdgeInsets.all(8),
      margin: margin,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 4,
          offset: Offset(0, 4)
        )]
      ),
      child: InkWell(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.network(city.icon)
            ),
            Expanded(
              flex: 1,
              child: Text(city.name, style: fontStyle.bodyText1)
            )
          ],
        ),
        onTap: (){},
      ),
    );
  }
}