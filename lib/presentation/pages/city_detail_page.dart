import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/city.dart';
import 'package:jelajah/presentation/blocs/user/user_bloc.dart';
import 'package:jelajah/presentation/widgets/card_clear_plan.dart';
import 'package:jelajah/presentation/widgets/card_place.dart';
import 'package:jelajah/presentation/widgets/card_plan.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CityDetailPage extends StatelessWidget {
  final CityModel cityDetail;

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
                  child: CachedNetworkImage(
                    imageUrl: cityDetail.icon,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: 64,
                  ),
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
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is UserHasData) {
                          return SizedBox(
                            height: 48 * cityDetail.plans.length.toDouble(),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              shrinkWrap: true,
                              itemCount: cityDetail.plans.length,
                              itemBuilder: (context, index) {
                                final plan = state.user.plans!.where(
                                    (element) =>
                                        element.name ==
                                        cityDetail.plans[index].name);
                                if (plan.isEmpty) {
                                  return CardPlan(
                                      plan: cityDetail.plans[index]);
                                } else {
                                  if (plan.first.status) {
                                    return CardClearPlan(plan: plan.first);
                                  } else {
                                    return CardPlan(plan: plan.first);
                                  }
                                }
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
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
                  itemCount: cityDetail.places.length,
                  itemBuilder: (context, index) {
                    return CardPlace(
                        place: cityDetail.places[index],
                        index: index,
                        length: cityDetail.places.length);
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
