import 'package:flutter/material.dart';
import 'package:jelajah/presentation/widgets/card_city_explore.dart';

import '../../domain/entity/city.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  List<City> cityList = [
    const City(
        id: '1',
        name: 'Yogyakarta',
        icon:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png',
        description: 'lorem'),
    const City(
        id: '2',
        name: 'Surabaya',
        icon:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png',
        description: 'lorem'),
    const City(
        id: '3',
        name: 'Malang',
        icon:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png',
        description: 'lorem'),
  ];

  static const colorAbu = Color(0xff8F8F8F);

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
                  children: const [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 18),
                        child: Text('List Kota',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w700))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 150 * cityList.length.toDouble(),
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(24, 16, 25, 0),
              scrollDirection: Axis.vertical,
              itemCount: cityList.length,
              itemBuilder: (context, index) {
                return CardCityExplore(
                    city: cityList[index],
                    index: index,
                    length: cityList.length);
              },
            ),
          ),
        ],
      ),
    );
  }
}
