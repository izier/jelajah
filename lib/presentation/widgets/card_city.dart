import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/city.dart';
import 'package:jelajah/models/city_detail.dart';
import 'package:jelajah/models/place.dart';
import 'package:jelajah/models/plan.dart';
import 'package:jelajah/presentation/pages/city_detail_page.dart';

class CardCity extends StatelessWidget {
  final City city;
  final int index;
  final int length;

  CardCity({required this.city, required this.index, required this.length});


  CityDetail cityDetail = new CityDetail(id: '1', name: 'Yogyakarta', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eros justo, egestas eu eros quis, dapibus viverra tellus. Fusce id dapibus nisl. Etiam libero erat, sagittis ac lectus ac, elementum varius sem. Vestibulum suscipit eros tellus, ut dignissim leo lacinia rutrum. Morbi sollicitudin eget ex blandit tempus.', coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', planList: [
    new Plan(id: '1', name: 'Yogyakarta basic plan', status: false),
    new Plan(id: '2', name: 'Yogyakarta culinary plan', status: false)], placeList: [
    new Place(id: '1', name: 'Pantai Parangtritis', coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    new Place(id: '1', name: 'Pantai Parangtritis', coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    new Place(id: '1', name: 'Pantai Parangtritis', coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  ]);

  @override
  Widget build(BuildContext context) {
    var margin;
    if (index == 0) {
      margin = EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 8);
    } else if(index == length - 1){
      margin = EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 24);
    } else {
      margin = EdgeInsets.all(8);
    }
    return Container(
      padding: EdgeInsets.all(8),
      margin: margin,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 4,
          offset: Offset(0, 4)
        )]
      ),
      child: InkWell(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.network(city.icon)
            ),
            Expanded(
              flex: 1,
              child: Text(city.name, style: fontStyle.bodyText1)
            )
          ],
        ),
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => CityDetailPage(cityDetail: cityDetail)),
          );
        },
      ),
    );
  }
}