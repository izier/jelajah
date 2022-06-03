import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/place.dart';

class CardPlace extends StatelessWidget {
  final Place place;
  final int index;

  CardPlace({required this.place, required this.index});

  @override
  Widget build(BuildContext context) {
    var margin;
    if (index == 0) {
      margin = EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 8);
    } else {
      margin = EdgeInsets.all(8);
    }

    return Container(
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
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(place.coverImage, width: 120, fit: BoxFit.cover))),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(right: 8, left: 8, top: 12),
                child: Text(place.name, style: fontStyle.bodyText1, textAlign: TextAlign.center)))
          ],
        ),
        onTap: (){},
      ),
    );
  }
}