import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/pages/city_detail_page.dart';

import '../../domain/entity/city.dart';
import '../../domain/entity/city_detail.dart';
import '../../domain/entity/place.dart';
import '../../domain/entity/plan.dart';

class CardCityExplore extends StatelessWidget {
  final City city;
  final int index;
  final int length;

  CardCityExplore(
      {Key? key, required this.city, required this.index, required this.length})
      : super(key: key);

  CityDetail cityDetail = CityDetail(
      id: '1',
      name: 'Yogyakarta',
      icon:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eros justo, egestas eu eros quis, dapibus viverra tellus. Fusce id dapibus nisl. Etiam libero erat, sagittis ac lectus ac, elementum varius sem. Vestibulum suscipit eros tellus, ut dignissim leo lacinia rutrum. Morbi sollicitudin eget ex blandit tempus.',
      coverImage:
          'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      planList: const [
        Plan(id: '1', name: 'Yogyakarta basic plan', status: false),
        Plan(id: '2', name: 'Yogyakarta culinary plan', status: false)
      ],
      placeList: const [
        Place(
            id: '1',
            name: 'Pantai Parangtritis',
            coverImage:
                'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
        Place(
            id: '1',
            name: 'Pantai Parangtritis',
            coverImage:
                'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
        Place(
            id: '1',
            name: 'Pantai Parangtritis',
            coverImage:
                'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
      ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      margin: const EdgeInsets.only(bottom: 16),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 4,
                offset: const Offset(0, 4))
          ]),
      child: InkWell(
        child: Row(
          children: [
            Image.network(city.icon),
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 0, 8),
                    child: Text(city.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                    child: Text(city.description,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400))),
              ],
            )
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CityDetailPage(cityDetail: cityDetail)),
          );
        },
      ),
    );
  }
}
