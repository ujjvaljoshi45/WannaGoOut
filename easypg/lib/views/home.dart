import 'package:easypg/constants.dart';
import 'package:easypg/views/my_list_view.dart';
import 'package:easypg/views/profile_view.dart';
import 'package:easypg/views/property_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  static const routeName = 'home';
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> myViews = [
    PropertyView(),
    const MyListView(),
    const ProfileView()
  ];
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'EasyPG',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 0.5,
                  offset: Offset(0.5, 0.5),
                ),
              ],
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: EdgeInsets.only(
                left: 18.0,
                right: 18.0,
                bottom: 8.0,
              ),
              child: TextField(
                  autocorrect: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(Icons.search),
                    alignLabelWithHint: true,
                    hintText: 'Search...',
                    border: OutlineInputBorder(),
                  )),
            ),
          ),
          shadowColor: Colors.black,
          elevation: 1.5,
          backgroundColor: appBarColor,
        ),
        body: myViews[myIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: appBarColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: appBarColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'My List',
              backgroundColor: appBarColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: appBarColor,
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
        ));
  }
}
