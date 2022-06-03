import 'package:flutter/material.dart';
import 'package:jelajah/presentation/widgets/card_place.dart';
import 'package:jelajah/presentation/widgets/card_plan.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/widgets/card_city.dart';
import 'package:jelajah/models/city.dart';
import 'package:jelajah/models/plan.dart';
import 'package:jelajah/models/place.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<City> cityList = [
    new City(id: '1', name: 'Yogyakarta', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png', description: 'lorem'),
    new City(id: '2', name: 'Surabaya', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png', description: 'lorem'),
    new City(id: '3', name: 'Malang', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png', description: 'lorem'),
  ];
  List<Plan> planList = [
    new Plan(id: '1', name: 'Yogyakarta basic plan', category: 1, description: 'lorem', missionList: [], placeList: [], status: false),
  ];
  List<Place> placeList =[
    new Place(name: 'Pantai Parangtritis', address: 'alamat', description: 'lorem', rating: 4.6, planList: [], image: [], coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    new Place(name: 'Pantai Parangtritis', address: 'alamat', description: 'lorem', rating: 4.6, planList: [], image: [], coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    new Place(name: 'Pantai Parangtritis', address: 'alamat', description: 'lorem', rating: 4.6, planList: [], image: [], coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Halo Felisa', style: fontStyle.headline1),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset('assets/images/level_2.png', width: 16),
                        SizedBox(width: 4),
                        Text('Penjelajah Pemula II', style: fontStyle.caption),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Image.asset('assets/images/home_banner.png')
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LinearPercentIndicator(
                  padding: EdgeInsets.all(0),
                  lineHeight: 4,
                  percent: 1100/2000,
                  progressColor: Theme.of(context).primaryColor,
                  barRadius: Radius.circular(20),
                ),
                SizedBox(height: 4),
                Text('1100/2000 exp', style: fontStyle.caption),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Padding(padding: EdgeInsets.symmetric(horizontal: 24),child: Text('Misi kamu', style: fontStyle.headline2)),
                SizedBox(height: 8),
                Container(
                  height: 48 * planList.length.toDouble(),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                    shrinkWrap: true,
                    itemCount: planList.length,
                    itemBuilder: (context, index) {
                      return CardPlan(plan: planList[index]);
                    },
                  ),
                ),
                SizedBox(height: 16),
                Padding(padding: EdgeInsets.symmetric(horizontal: 24),child: Text('Kota terpopuler', style: fontStyle.headline2)),
                SizedBox(height: 8),
                Container(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cityList.length,
                    itemBuilder: (context, index) {
                      return CardCity(city: cityList[index], index: index);
                    },
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text('Tempat terpopuler', style: fontStyle.headline2),
                ),
                SizedBox(height: 8),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cityList.length,
                    itemBuilder: (context, index) {
                      return CardPlace(place: placeList[index], index: index);
                    },
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}