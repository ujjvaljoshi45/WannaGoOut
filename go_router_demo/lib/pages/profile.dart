import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Hero(
              tag: 'logo',
              child: Image(
                height: MediaQuery.of(context).size.height * 0.125,
                width: MediaQuery.of(context).size.width * 0.125,
                image: const AssetImage('assets/images/splash_logo.png'),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                GoRouter.of(context).go('/');
              },
            )),
        backgroundColor: Colors.black,
        body: const Center(
          child: Text('Profile'),
        ),
      ),
    );
  }
}
