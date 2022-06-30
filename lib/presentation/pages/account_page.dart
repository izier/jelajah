import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/widgets/card_clear_mission.dart';
import 'package:jelajah/presentation/widgets/card_menu.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../domain/entity/menu.dart';
import '../../domain/entity/plan.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  List<Plan> planList = [
    const Plan(id: '1', name: 'Yogyakarta nature plan', status: false),
  ];

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
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 18),
                        child: Text('Felisa Indah Sari',
                            style: fontStyle.headline1)),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                        child: Text('Hallo ini adalah status ku',
                            style: fontStyle.caption)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset('assets/images/level_2.png', width: 24),
                        const SizedBox(width: 4),
                        Text('Penjelajah Pemula II', style: fontStyle.caption),
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
                    padding: const EdgeInsets.fromLTRB(24, 12, 0, 11),
                    child: Text('Misi selesai', style: fontStyle.headline2)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 48 * planList.length.toDouble(),
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                    shrinkWrap: true,
                    itemCount: planList.length,
                    itemBuilder: (context, index) {
                      return CardClearMission(plan: planList[index]);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 0, 0),
                    child: Text('Menu', style: fontStyle.headline2)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 30 * menuList.length.toDouble(),
                  child: ListView.builder(
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
                    child: Row(
                      children: [
                        const Icon(Icons.logout, color: Colors.red),
                        const SizedBox(width: 4),
                        Text('Keluar', style: fontStyle.headline4),
                      ],
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
