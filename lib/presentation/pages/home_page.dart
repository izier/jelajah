import 'package:flutter/material.dart';
import 'package:jelajah/data/dummy/dummy_data.dart';

import 'package:jelajah/presentation/widgets/card_place.dart';
import 'package:jelajah/presentation/widgets/card_plan.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/widgets/card_city.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Halo Felisa', style: fontStyle.headline1),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset('assets/images/level_2.png', width: 16),
                        const SizedBox(width: 4),
                        Text('Penjelajah Pemula II', style: fontStyle.caption),
                      ],
                    )
                  ],
                ),
                const SizedBox(width: 24),
                Expanded(child: Image.asset('assets/images/home_banner.png'))
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LinearPercentIndicator(
                  padding: const EdgeInsets.all(0),
                  lineHeight: 4,
                  percent: 1100 / 2000,
                  progressColor: Theme.of(context).primaryColor,
                  barRadius: const Radius.circular(20),
                ),
                const SizedBox(height: 4),
                Text('1100/2000 exp', style: fontStyle.caption),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text('Misi kamu', style: fontStyle.headline2)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 48 * planList.length.toDouble(),
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                    shrinkWrap: true,
                    itemCount: planList.length,
                    itemBuilder: (context, index) {
                      return CardPlan(plan: planList[index]);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text('Kota terpopuler', style: fontStyle.headline2)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cityList.length,
                    itemBuilder: (context, index) {
                      return CardCity(
                          city: cityList[index],
                          index: index,
                          length: cityList.length);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text('Tempat terpopuler', style: fontStyle.headline2),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: placeList.length,
                    itemBuilder: (context, index) {
                      return CardPlace(
                          place: placeList[index],
                          index: index,
                          length: placeList.length);
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
