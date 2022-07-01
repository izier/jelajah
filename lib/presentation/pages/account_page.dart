import 'package:flutter/material.dart';
import 'package:jelajah/common/constants.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/data/service/shared_preference_service.dart';
import 'package:jelajah/domain/entity/user.dart';
import 'package:jelajah/presentation/pages/welcome_page.dart';
import 'package:jelajah/presentation/widgets/card_clear_mission.dart';
import 'package:jelajah/presentation/widgets/card_menu.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../domain/entity/menu.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  List<PlanModel> planList = [];

  List<Menu> menuList = [
    Menu(id: '1', name: 'Edit Profil'),
    Menu(id: '2', name: 'Pengaturan'),
    Menu(id: '3', name: 'FAQ'),
    Menu(id: '4', name: 'Kebijakan privasi'),
    Menu(id: '5', name: 'Layanan pengguna'),
    Menu(id: '6', name: 'Tentang Kami'),
  ];

  static const colorAbu = Color(0xff8F8F8F);

  @override
  Widget build(BuildContext context) {
    final user = Constant.user;
    int percent = 0;
    String level = 'Penjelajah ';
    String image = '';
    int points = user!.points;
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(user.fullname, style: fontStyle.headline1),
                    const SizedBox(height: 8),
                    Text(user.username, style: fontStyle.caption),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset('assets/images/level_$image.png',
                            width: 24),
                        const SizedBox(width: 4),
                        Text(level, style: fontStyle.caption),
                      ],
                    )
                  ],
                ),
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
                  percent: points / percent,
                  progressColor: Theme.of(context).primaryColor,
                  barRadius: const Radius.circular(20),
                ),
                const SizedBox(height: 4),
                Text('$points/$percent exp', style: fontStyle.caption),
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
                    padding: const EdgeInsets.fromLTRB(24, 12, 0, 11),
                    child: Text('Misi selesai', style: fontStyle.headline2)),
                const SizedBox(height: 8),
                _missionBuilder(user),
                const SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 0, 0),
                    child: Text('Menu', style: fontStyle.headline2)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 40 * menuList.length.toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      return CardMenu(menuItem: menuList[index]);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 11),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: CardClearMission.colorMerah,
                          style: BorderStyle.solid,
                          width: 2.0,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  CardClearMission.colorMerah.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 4))
                        ]),
                    child: InkWell(
                      child: Row(
                        children: [
                          const Icon(Icons.logout, color: Colors.red),
                          const SizedBox(width: 4),
                          Text('Keluar', style: fontStyle.headline4),
                        ],
                      ),
                      onTap: () {
                        final prefs = SharedPreferenceService();
                        prefs.setAuthenticated(false);
                        prefs.setUserSession(0);
                        Constant.user = null;
                        const SnackBar snackBar = SnackBar(
                          content: Text('Berhasil keluar'),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomePage()),
                            (route) => false);
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _missionBuilder(User user) {
  if (user.plans!.isNotEmpty) {
    return SizedBox(
      height: 48 * user.plans!.length.toDouble(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        shrinkWrap: true,
        itemCount: user.plans!.length,
        itemBuilder: (context, index) {
          if (user.plans![index].status) {
            return CardClearMission(plan: user.plans![index]);
          }
          return Container();
        },
      ),
    );
  } else {
    return Center(
      child: Text(
        'Anda belum menyelesaikan misi apapun',
        style: fontStyle.bodyText1,
      ),
    );
  }
}
