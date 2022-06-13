import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/place_detail.dart';
import 'package:jelajah/presentation/widgets/card_plan.dart';

class PlaceDetailPage extends StatelessWidget {
  PlaceDetail placeDetail;

  PlaceDetailPage({required this.placeDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black),
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(placeDetail.name, style: fontStyle.headline2),
              elevation: 0,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(placeDetail.coverImage, fit: BoxFit.cover)
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(top: 24, bottom: 8, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(placeDetail.name, style: fontStyle.headline1),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 2),
                          Text(placeDetail.rating.toString())
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(placeDetail.address, style: fontStyle.caption),
                    SizedBox(height: 16),
                    Text(placeDetail.description, style: fontStyle.bodyText1),
                    SizedBox(height: 16),
                    Text('Ada di paket misi', style: fontStyle.headline2),
                    SizedBox(height: 8),
                    Container(
                      height: 48 * placeDetail.planList.length.toDouble(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: placeDetail.planList.length,
                        itemBuilder: (context, index) {
                          return CardPlan(plan: placeDetail.planList[index]);
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Foto', style: fontStyle.headline2)
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: placeDetail.image.length,
                  itemBuilder: (context, index) {
                    var margin;
                    if (index == 0) {
                      margin = EdgeInsets.only(left: 24, right: 8);
                    } else if (index == placeDetail.image.length - 1) {
                      margin = EdgeInsets.only(left: 8, right: 24);
                    } else {
                      margin = EdgeInsets.symmetric(horizontal: 8);
                    }
                    return Container(margin: margin, child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(placeDetail.image[index], width: 280, fit: BoxFit.cover)));
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