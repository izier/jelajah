import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/pages/plan_detail_page.dart';

import '../../domain/entity/menu.dart';

class CardMenu extends StatelessWidget {
  Menu menuItem;

  CardMenu({Key? key,
    required this.menuItem
  }) : super(key: key);

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
              Text('\u2022 ' +menuItem.name,
                style: const TextStyle(fontSize: 16,color: Colors.black ,fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        onTap: () {
        }
    );
  }
}
