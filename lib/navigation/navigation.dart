import 'package:flutter/material.dart';
import 'package:test_project/res/app_colors.dart';
import 'package:test_project/res/app_strings.dart';
import 'feed_page.dart';
import 'blank_page.dart';
import '../res/my_flutter_app_icons.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigation();
  }
}

class Navigation extends StatefulWidget {
  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FeedPage(),
    BlankPage('2nd page'),
    BlankPage('3rd page'),
    BlankPage('4th page'),
    BlankPage('5th page')
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.news,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
          child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: _pages[_currentIndex]
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onMenuItemSelected,
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(
            color: AppColors.red,
            fontSize: 12.0
        ),
        selectedItemColor: AppColors.red,
        selectedIconTheme: IconThemeData(
            color: AppColors.red),
        unselectedIconTheme: IconThemeData(
          color: AppColors.grey
        ),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  MyFlutterApp.doc_text,
                  size: 24.0),
              label: AppStrings.news),
          BottomNavigationBarItem(
              icon: Icon(
                  MyFlutterApp.apple,
                  size: 26.0),
              label: AppStrings.apple),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.person_outline,
                  size: 30.0),
              label: AppStrings.profile),
          BottomNavigationBarItem(
              icon: Icon(
                  MyFlutterApp.gym,
                  size: 20.0),
              label: AppStrings.gym),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.map_outlined,
                  size: 26.0),
              label: AppStrings.map)
        ],
      ),
    );
  }

  void onMenuItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}