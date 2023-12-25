import 'package:easypg/views/auth_page.dart';
import 'package:easypg/views/home.dart';
import 'package:easypg/views/property_detail_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'EasyPG',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const AuthPage(),
        routes: {
          Home.routeName: (context) => Home(),
          AuthPage.routeName: (context) => const AuthPage(),
          PropertyDetialView.routeName: (context) => PropertyDetialView(),
        });
  }
}
