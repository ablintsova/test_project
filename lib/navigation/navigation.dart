import 'package:flutter/material.dart';
import 'feed_page.dart';
import 'blank_page.dart';
import '../my_flutter_app_icons.dart';

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
          'News',
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
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.doc_text,
                  color: Color.fromRGBO(209, 65, 79, 1)),
              label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.apple,
                  color: Color.fromRGBO(206, 208, 213, 1)),
              label: 'Apple'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,
                  color: Color.fromRGBO(206, 208, 213, 1)),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon:
              Icon(MyFlutterApp.gym, color: Color.fromRGBO(206, 208, 213, 1)),
              label: 'Gym'),
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined,
                  color: Color.fromRGBO(206, 208, 213, 1)),
              label: 'Map')
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