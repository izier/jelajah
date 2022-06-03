import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage>{
  int _selectedPage = 0;

  static List<Widget> _menus = <Widget>[
    HomePage(),
    Text(
      'Jelajah',
    ),
    Text(
      'Akun',
    ),
  ];

  void _onMenuTapped (int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset('assets/images/logo_text.png', width: 96),
        elevation: 0,
      ),
      body: _menus.elementAt(_selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Jelajah'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun'
          ),
        ],
        currentIndex: _selectedPage,
        unselectedLabelStyle: fontStyle.subtitle2,
        selectedLabelStyle: fontStyle.subtitle1,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onMenuTapped,
      ),
    );
  }
}