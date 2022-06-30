import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/domain/entity/city_detail.dart';
import 'package:jelajah/presentation/widgets/card_place.dart';
import 'package:jelajah/presentation/widgets/card_plan.dart';

class CityDetailPage extends StatelessWidget {
  final CityDetail cityDetail;

  const CityDetailPage({Key? key, required this.cityDetail}) : super(key: key);

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
              title: Text(cityDetail.name, style: fontStyle.headline2),
              elevation: 0,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.bottomRight,
                  child: Image.network(cityDetail.icon, width: 64),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(cityDetail.coverImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 24, left: 24, right: 24, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(cityDetail.name, style: fontStyle.headline1),
                    const SizedBox(height: 24),
                    Text(cityDetail.description, style: fontStyle.bodyText1),
                    const SizedBox(height: 16),
                    Text('Paket misi tersedia', style: fontStyle.headline2),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 48 * cityDetail.planList.length.toDouble(),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        shrinkWrap: true,
                        itemCount: cityDetail.planList.length,
                        itemBuilder: (context, index) {
                          return CardPlan(plan: cityDetail.planList[index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Tempat wisata', style: fontStyle.headline2)
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cityDetail.placeList.length,
                  itemBuilder: (context, index) {
                    return CardPlace(
                        place: cityDetail.placeList[index],
                        index: index,
                        length: cityDetail.placeList.length);
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
