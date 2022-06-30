import 'package:jelajah/domain/entity/city.dart';
import 'package:jelajah/domain/entity/city_detail.dart';
import 'package:jelajah/domain/entity/mission.dart';
import 'package:jelajah/domain/entity/place.dart';
import 'package:jelajah/domain/entity/place_detail.dart';
import 'package:jelajah/domain/entity/plan.dart';
import 'package:jelajah/domain/entity/plan_detail.dart';

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
List<Plan> planList = [
  const Plan(id: '1', name: 'Yogyakarta basic plan', status: false),
  const Plan(id: '2', name: 'Yogyakarta culinary plan', status: false),
];
List<Place> placeList = [
  const Place(
      id: '1',
      name: 'Pantai Parangtritis',
      coverImage:
          'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
];

CityDetail cityDetail = const CityDetail(
    id: '1',
    name: 'Yogyakarta',
    icon:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Circle_-_black_simple.svg/500px-Circle_-_black_simple.svg.png',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eros justo, egestas eu eros quis, dapibus viverra tellus. Fusce id dapibus nisl. Etiam libero erat, sagittis ac lectus ac, elementum varius sem. Vestibulum suscipit eros tellus, ut dignissim leo lacinia rutrum. Morbi sollicitudin eget ex blandit tempus.',
    coverImage:
        'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    planList: <Plan>[
      Plan(id: '1', name: 'Yogyakarta basic plan', status: false),
      Plan(id: '2', name: 'Yogyakarta culinary plan', status: false)
    ],
    placeList: <Place>[
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

PlaceDetail placeDetail = const PlaceDetail(
    id: '1',
    name: 'Pantai Parangtritis',
    address: 'alamat',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eros justo, egestas eu eros quis, dapibus viverra tellus. Fusce id dapibus nisl. Etiam libero erat, sagittis ac lectus ac, elementum varius sem. Vestibulum suscipit eros tellus, ut dignissim leo lacinia rutrum. Morbi sollicitudin eget ex blandit tempus.',
    rating: 4.6,
    planList: <Plan>[
      Plan(id: '1', name: 'Yogyakarta basic plan', status: false)
    ],
    image: <String>[
      'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    ],
    coverImage:
        'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80');

PlanDetail planDetail = const PlanDetail(
    id: '2',
    name: 'Yogyakarta culinary plan',
    category: 1,
    description: 'lorem',
    missionList: <Mission>[
      Mission(
          id: '1',
          name: 'testing misi',
          planName: 'Yogyakarta basic plan',
          planId: '1')
    ],
    placeList: <Place>[
      Place(
          id: '1',
          name: 'Yogyakarta',
          coverImage:
              'https://images.unsplash.com/photo-1606820031302-d26dcd6b8990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
    ],
    status: false);
