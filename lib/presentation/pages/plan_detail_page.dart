import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/common/constants.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/plan.dart';
import 'package:jelajah/presentation/blocs/user/user_bloc.dart';
import 'package:jelajah/presentation/widgets/card_mission.dart';

class PlanDetailPage extends StatefulWidget {
  final PlanModel planDetail;

  const PlanDetailPage({Key? key, required this.planDetail}) : super(key: key);

  @override
  State<PlanDetailPage> createState() => _PlanDetailPageState();
}

class _PlanDetailPageState extends State<PlanDetailPage> {
  @override
  Widget build(BuildContext context) {
    final user = Constant.user;
    var plan = user!.plans!.where(
      (element) => element.id == widget.planDetail.id,
    );
    bool isAdded = plan.isNotEmpty ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoading) {
            const SnackBar snackBar = SnackBar(
              content: Text('Menambahkan plan'),
              backgroundColor: Colors.grey,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is AddSuccess) {
            const SnackBar snackBar = SnackBar(
              content: Text('Plan berhasil ditambahkan'),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            setState(() {
              plan = user.plans!
                  .where((element) => element.id == widget.planDetail.id);
              isAdded = plan.isNotEmpty ? true : false;
            });
          } else if (state is AddFailed) {
            const SnackBar snackBar = SnackBar(
              content: Text('Terdapat kesalahan'),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 4,
                            child: Text(widget.planDetail.name,
                                style: fontStyle.headline1)),
                        Expanded(
                            flex: 1,
                            child: Image.network(widget.planDetail.category)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text('0 dari ' +
                        widget.planDetail.missions.length.toString() +
                        ' telah selesai'),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.planDetail.description,
                            style: fontStyle.bodyText1),
                        const SizedBox(height: 16),
                        Text('Daftar misi', style: fontStyle.headline2),
                        const SizedBox(height: 8),
                        SizedBox(
                          height:
                              72 * widget.planDetail.missions.length.toDouble(),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.planDetail.missions.length,
                            itemBuilder: (context, index) {
                              return CardMission(
                                  mission: widget.planDetail.missions[index],
                                  index: index);
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: isAdded ? secondaryButton : primaryButton,
                  child: isAdded
                      ? Text('Telah ditambahkan', style: fontStyle.button)
                      : Text('Masukkan ke daftar plan',
                          style: fontStyle.button),
                  onPressed: () {
                    context.read<UserBloc>().add(AddPlanEvent(
                          PlanModel(
                              id: widget.planDetail.id,
                              name: widget.planDetail.name,
                              category: widget.planDetail.category,
                              description: widget.planDetail.description,
                              missions: widget.planDetail.missions,
                              status: widget.planDetail.status),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
