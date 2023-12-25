import 'package:easypg/views/home.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  static const routeName = 'auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool otpRequest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 200, width: 200),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Enter Phone No:',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  otpRequest = !otpRequest;
                });
                if (otpRequest) {
                  Navigator.pushNamed(context, Home.routeName);
                }
              },
              child:
                  otpRequest ? const Text('Verify OTP') : const Text('Get OTP'),
            ),
          ],
        )),
      ),
    );
  }
}
