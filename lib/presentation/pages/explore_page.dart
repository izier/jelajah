import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/blocs/city/city_bloc.dart';
import 'package:jelajah/presentation/widgets/card_city_explore.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<CityBloc>(context, listen: false).add(GetCityEvent());
    });
  }

  static const colorAbu = Color(0xff8F8F8F);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: Text('List Kota', style: fontStyle.headline1)),
          const SizedBox(height: 8),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              if (state is CityLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CityHasData) {
                return SizedBox(
                  height: 150 * state.cities.length.toDouble(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    scrollDirection: Axis.vertical,
                    itemCount: state.cities.length,
                    itemBuilder: (context, index) {
                      return CardCityExplore(
                          city: state.cities[index],
                          index: index,
                          length: state.cities.length);
                    },
                  ),
                );
              } else if (state is CityFailed) {
                return Text(state.message);
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
