import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/city.dart';

import 'package:jelajah/presentation/pages/city_detail_page.dart';

class CardCity extends StatelessWidget {
  final CityModel city;
  final int index;
  final int length;

  const CardCity({
    Key? key,
    required this.city,
    required this.index,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin;
    if (index == 0) {
      margin = const EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 8);
    } else if (index == length - 1) {
      margin = const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 24);
    } else {
      margin = const EdgeInsets.all(8);
    }
    return Container(
      padding: const EdgeInsets.all(8),
      margin: margin,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 4))
          ]),
      child: InkWell(
        child: Column(
          children: [
            Expanded(flex: 4, child: Image.network(city.icon)),
            Expanded(
                flex: 1, child: Text(city.name, style: fontStyle.bodyText1))
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CityDetailPage(
                cityDetail: city,
              ),
            ),
          );
        },
      ),
    );
  }
}
