import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/pages/about.dart';
import 'package:go_router_demo/pages/contact_us.dart';
import 'package:go_router_demo/pages/home.dart';
import 'package:go_router_demo/pages/profile.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/aboutus',
      name: 'about_us',
      pageBuilder: (context, state) => const MaterialPage(
        child: AboutUs(),
      ),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      pageBuilder: (context, state) => const MaterialPage(
        child: Profile(),
      ),
    ),
    GoRoute(
      path: '/contactus',
      name: 'contact_us',
      pageBuilder: (context, state) => const MaterialPage(
        child: ContactUs(),
      ),
    ),
  ]);
}
