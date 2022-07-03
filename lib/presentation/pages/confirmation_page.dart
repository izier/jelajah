import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jelajah/common/constants.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/data/model/mission.dart';
import 'package:jelajah/presentation/blocs/user/user_bloc.dart';
import 'package:jelajah/presentation/pages/sent_page.dart';

class ConfirmationPage extends StatelessWidget {
  final String pathFile;
  final String iconUrl;
  final MissionModel mission;

  const ConfirmationPage({
    Key? key,
    required this.mission,
    required this.pathFile,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(GetUserEvent(Constant.userSession));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UploadLoading) {
            const SnackBar snackBar = SnackBar(
              content: Text('Mengunggah foto'),
              backgroundColor: Colors.grey,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is UploadPhotoSuccess) {
            const SnackBar snackBar = SnackBar(
              content: Text('Foto berhasil diunggah'),
              backgroundColor: Colors.green,
            );
            BlocProvider.of<UserBloc>(context, listen: false)
                .add(GetUserEvent(Constant.userSession));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SentPage(),
              ),
            );
          } else if (state is UploadPhotoFailed) {
            const SnackBar snackBar = SnackBar(
              content: Text('Terdapat kesalahan'),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(mission.name, style: fontStyle.headline1)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: iconUrl,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Foto', style: fontStyle.headline2),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            mission.name,
                            style: fontStyle.headline2,
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(pathFile),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width - 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pastikan bahwa objek yang difoto telah sesuai dengan misi yang akan diselesaikan dan dapat terlihat dengan jelas.',
                      style: fontStyle.caption,
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    child: Text('Ganti foto', style: fontStyle.button),
                    style: secondaryButton,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    child: Text('Kirim', style: fontStyle.button),
                    style: primaryButton,
                    onPressed: () {
                      BlocProvider.of<UserBloc>(context).add(UploadImageEvent(
                          pathFile, Constant.userSession, mission.id));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
