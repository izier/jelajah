import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/city.dart';
import 'package:jelajah/presentation/pages/city_detail_page.dart';

class CardCityExplore extends StatefulWidget {
  final CityModel city;
  final int index;
  final int length;

  const CardCityExplore(
      {Key? key, required this.city, required this.index, required this.length})
      : super(key: key);

  @override
  State<CardCityExplore> createState() => _CardCityExploreState();
}

class _CardCityExploreState extends State<CardCityExplore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      height: 120,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: widget.city.icon,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.city.name, style: fontStyle.headline2),
                const SizedBox(height: 8),
                SizedBox(
                  width: 200,
                  child: Text(
                    widget.city.description,
                    style: fontStyle.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                )
              ],
            )
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CityDetailPage(cityDetail: widget.city)),
          );
        },
      ),
    );
  }
}
