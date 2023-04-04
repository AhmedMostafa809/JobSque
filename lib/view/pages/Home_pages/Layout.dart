import 'package:final_project/view/pages/Home_pages/home_screen.dart';
import 'package:final_project/view/pages/Messages/messages_page.dart';
import 'package:final_project/view/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

import '../../../utilities/theme/app_themes.dart';

class LayOut extends StatefulWidget {
  const LayOut({Key? key}) : super(key: key);

  @override
  _LayOutState createState() => _LayOutState();
}

List<Widget> widgetsList = <Widget>[
  HomePage(),
  MessagesPage(),
  ProfilePage(),
  ProfilePage(),
  ProfilePage(),
  // const NewsCardItem(),
  // const SettingsWidget(),
];
int _currentIndex = 0;

class _LayOutState extends State<LayOut> {
  @override
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: widgetsList.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Applied',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        elevation: 1000,
        unselectedItemColor: AppTheme.grey,
        selectedItemColor: AppTheme.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
