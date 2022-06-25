import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/dummy/dummy_data.dart';
import 'package:jelajah/domain/entity/place.dart';
import 'package:jelajah/presentation/pages/place_detail_page.dart';

class CardPlace extends StatelessWidget {
  final Place place;
  final int index;
  final int length;

  const CardPlace({
    Key? key,
    required this.place,
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
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  place.coverImage,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 12),
                child: Text(
                  place.name,
                  style: fontStyle.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceDetailPage(
                placeDetail: placeDetail,
              ),
            ),
          );
        },
      ),
    );
  }
}
