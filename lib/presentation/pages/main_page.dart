import 'package:flutter/material.dart';
import 'package:jelajah/common/theme.dart';
import 'package:jelajah/presentation/pages/account_page.dart';
import 'package:jelajah/presentation/pages/explore_page.dart';
import 'package:jelajah/presentation/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  static final List<Widget> _menus = <Widget>[
    const HomePage(),
    const ExplorePage(),
    const AccountPage()
  ];

  void _onMenuTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Image.asset('assets/images/logo_text.png', width: 96),
        elevation: 0,
      ),
      body: _menus.elementAt(_selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Jelajah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
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
