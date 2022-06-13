import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/models/place.dart';
import 'package:jelajah/models/place_detail.dart';
import 'package:jelajah/models/plan.dart';
import 'package:jelajah/presentation/pages/place_detail_page.dart';

class CardPlace extends StatelessWidget {
  final Place place;
  final int index;
  final int length;

  CardPlace({required this.place, required this.index, required this.length});

  PlaceDetail placeDetail = new PlaceDetail(id: '1', name: 'Pantai Parangtritis', address: 'alamat', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eros justo, egestas eu eros quis, dapibus viverra tellus. Fusce id dapibus nisl. Etiam libero erat, sagittis ac lectus ac, elementum varius sem. Vestibulum suscipit eros tellus, ut dignissim leo lacinia rutrum. Morbi sollicitudin eget ex blandit tempus.', rating: 4.6, planList: [new Plan(id: '1', name: 'Yogyakarta basic plan', status: false)], image: ['https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'], coverImage: 'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80');

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
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(place.coverImage, width: 120, fit: BoxFit.cover))),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(right: 8, left: 8, top: 12),
                child: Text(place.name, style: fontStyle.bodyText1, textAlign: TextAlign.center)))
          ],
        ),
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlaceDetailPage(placeDetail: placeDetail))
          );
        },
      ),
    );
  }
}