import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';

import '../../domain/entity/menu.dart';

class CardMenu extends StatelessWidget {
  final Menu menuItem;

  const CardMenu({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 16, 0, 0),
          margin: const EdgeInsets.only(bottom: 8),
          height: 40,
          child: Row(
            children: [
              const SizedBox(width: 4),
              Text('\u2022 ' + menuItem.name, style: fontStyle.headline3),
            ],
          ),
        ),
        onTap: () {});
  }
}
