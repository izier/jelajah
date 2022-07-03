import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/place.dart';
import 'package:jelajah/presentation/widgets/card_plan.dart';

class PlaceDetailPage extends StatelessWidget {
  final PlaceModel placeDetail;

  const PlaceDetailPage({Key? key, required this.placeDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              titleTextStyle: const TextStyle(color: Colors.black),
              iconTheme: const IconThemeData(color: Colors.black),
              title: Text(placeDetail.name, style: fontStyle.headline2),
              elevation: 0,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: placeDetail.coverImage,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.only(
                    top: 24, bottom: 8, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(placeDetail.name, style: fontStyle.headline1),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 2),
                        Text(placeDetail.rating.toString())
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(placeDetail.address, style: fontStyle.caption),
                    const SizedBox(height: 16),
                    Text(placeDetail.description, style: fontStyle.bodyText1),
                    const SizedBox(height: 16),
                    Text('Ada di paket misi', style: fontStyle.headline2),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 48 * placeDetail.plans.length.toDouble(),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        shrinkWrap: true,
                        itemCount: placeDetail.plans.length,
                        itemBuilder: (context, index) {
                          return CardPlan(plan: placeDetail.plans[index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Foto', style: fontStyle.headline2)
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: placeDetail.image.length,
                  itemBuilder: (context, index) {
                    EdgeInsets margin;
                    if (index == 0) {
                      margin = const EdgeInsets.only(left: 24, right: 8);
                    } else if (index == placeDetail.image.length - 1) {
                      margin = const EdgeInsets.only(left: 8, right: 24);
                    } else {
                      margin = const EdgeInsets.symmetric(horizontal: 8);
                    }
                    return Container(
                      margin: margin,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: placeDetail.image[index],
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
