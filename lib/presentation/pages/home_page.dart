import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/domain/entity/user.dart';
import 'package:jelajah/presentation/blocs/city/city_bloc.dart';
import 'package:jelajah/presentation/blocs/place/place_bloc.dart';
import 'package:jelajah/presentation/blocs/user/user_bloc.dart';
import 'package:jelajah/presentation/widgets/card_place.dart';
import 'package:jelajah/presentation/widgets/card_plan.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/common/constants.dart';
import 'package:jelajah/presentation/widgets/card_city.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<UserBloc>(context, listen: false)
          .add(GetUserEvent(Constant.userSession));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            if (state is UserLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is UserHasData) {
                              return Text(
                                  'Halo, ' +
                                      (state.user.fullname).split(' ').first +
                                      '!',
                                  style: fontStyle.headline1);
                            } else if (state is UserFailed) {
                              return Center(
                                child: Text(state.message),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        const SizedBox(height: 8),
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            if (state is UserLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is UserHasData) {
                              List data = _getLevel(state.user.points);
                              String image = data[1];
                              String level = data[2];
                              return Row(
                                children: [
                                  Image.asset(
                                    'assets/images/level_$image.png',
                                    width: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(level, style: fontStyle.caption),
                                ],
                              );
                            } else if (state is UserFailed) {
                              return Center(
                                child: Text(state.message),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Image.asset('assets/images/home_banner.png'),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is UserHasData) {
                      List data = _getLevel(state.user.points);
                      int percent = data[0];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LinearPercentIndicator(
                            padding: const EdgeInsets.all(0),
                            lineHeight: 4,
                            percent: state.user.points / percent,
                            progressColor: Theme.of(context).primaryColor,
                            barRadius: const Radius.circular(20),
                          ),
                          const SizedBox(height: 4),
                          Text(
                              state.user.points.toString() +
                                  '/' +
                                  percent.toString() +
                                  'exp',
                              style: fontStyle.caption),
                        ],
                      );
                    } else if (state is UserFailed) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
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
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is UserHasData) {
                      return _missionBuilder(state.user);
                    } else if (state is UserFailed) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text('Kota terpopuler', style: fontStyle.headline2)),
                const SizedBox(height: 8),
                BlocBuilder<CityBloc, CityState>(
                  builder: ((context, state) {
                    if (state is CityLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CityHasData) {
                      final cities = state.cities;
                      return SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cities.length,
                          itemBuilder: (context, index) {
                            return CardCity(
                                city: cities[index],
                                index: index,
                                length: cities.length);
                          },
                        ),
                      );
                    } else if (state is CityFailed) {
                      return Text(state.message);
                    } else {
                      return Container();
                    }
                  }),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text('Tempat terpopuler', style: fontStyle.headline2),
                ),
                const SizedBox(height: 8),
                BlocBuilder<PlaceBloc, PlaceState>(
                  builder: (context, state) {
                    if (state is PlaceLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is PlaceHasData) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.places.length,
                          itemBuilder: (context, index) {
                            return CardPlace(
                                place: state.places[index],
                                index: index,
                                length: state.places.length);
                          },
                        ),
                      );
                    } else if (state is PlaceFailed) {
                      return Text(state.message);
                    } else {
                      return Container();
                    }
                  },
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

Widget _missionBuilder(User user) {
  List<PlanModel>? planFix = user.plans;
  int counter = 0;
  for (int i = 0; i < user.plans!.length; i++) {
    var missions = user.plans![i].missions.where((element) => element.status);
    if (missions.length == user.plans![i].missions.length) {
      planFix!.removeAt(i - counter);
      counter++;
    }
  }
  if (planFix!.isEmpty) {
    return Center(
      child: Text(
        'Anda belum memiliki paket misi aktif',
        style: fontStyle.bodyText1,
      ),
    );
  } else {
    return SizedBox(
      height: 48 * planFix.length.toDouble(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        shrinkWrap: true,
        itemCount: planFix.length,
        itemBuilder: (context, index) {
          return CardPlan(plan: planFix[index]);
        },
      ),
    );
  }
}

List _getLevel(int points) {
  int percent;
  String image;
  String level = "Penjelajah";
  if (points <= 1000) {
    image = '1';
    level += 'Pemula I';
    percent = 1000;
  } else if (points <= 2000) {
    image = '2';
    level += 'Pemula II';
    percent = 2000;
  } else if (points <= 3000) {
    image = '3';
    level += 'Pemula III';
    percent = 3000;
  } else if (points <= 4000) {
    image = '4';
    level += 'Menengah I';
    percent = 4000;
  } else if (points <= 5000) {
    image = '5';
    level += 'Menengah II';
    percent = 5000;
  } else if (points <= 6000) {
    image = '6';
    level += 'Menengah III';
    percent = 6000;
  } else if (points <= 7000) {
    image = '7';
    level += 'Ahli I';
    percent = 7000;
  } else if (points <= 8000) {
    image = '8';
    level += 'Ahli II';
    percent = 8000;
  } else if (points <= 9000) {
    image = '9';
    level += 'Ahli III';
    percent = 9000;
  } else {
    image = '10';
    level += 'Sejati';
    percent = points;
  }

  return [percent, image, level];
}
