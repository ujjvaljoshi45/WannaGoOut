import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> showButton = [true, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Visibility(
                  visible: showButton[1],
                  child: ElevatedButton(
                    onPressed: () {
                      moveButton(1);
                    },
                    child: const Text('No'),
                  ),
                ),
              ),
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Visibility(
                  visible: showButton[2],
                  child: ElevatedButton(
                    onPressed: () {
                      moveButton(2);
                    },
                    child: const Text('No'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Visibility(
                  visible: showButton[3],
                  child: ElevatedButton(
                    onPressed: () {
                      moveButton(3);
                    },
                    child: const Text('No'),
                  ),
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Will you go on a date with me?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset('images/ask.gif', height: 300, width: 300),
                ],
              ),
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Visibility(
                  visible: showButton[4],
                  child: ElevatedButton(
                    onPressed: () {
                      moveButton(4);
                    },
                    child: const Text('No'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AcceptedState()));
                    },
                    child: const Text('Yes')),
              ),
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Visibility(
                    visible: showButton[0],
                    child: ElevatedButton(
                      onPressed: () {
                        moveButton(0);
                      },
                      child: const Text('No'),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Visibility(
                  visible: showButton[5],
                  child: ElevatedButton(
                    onPressed: () {
                      moveButton(5);
                    },
                    child: const Text('No'),
                  ),
                ),
              ),
              Hero(
                tag: 'logo',
                transitionOnUserGestures: true,
                child: Visibility(
                  visible: showButton[6],
                  child: ElevatedButton(
                    onPressed: () {
                      moveButton(6);
                    },
                    child: const Text('No'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void moveButton(int index) {
    setState(() {
      showButton[index] = false;
      int newIndex = 0;
      do {
        newIndex = Random().nextInt(7);
      } while (newIndex == index);
      showButton[newIndex] = true;
    });
  }
}

class AcceptedState extends StatefulWidget {
  const AcceptedState({super.key});

  @override
  State<AcceptedState> createState() => _AcceptedStateState();
}

class _AcceptedStateState extends State<AcceptedState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Yeaahhh!!',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Image.asset('images/yeah.gif'),
        ],
      ),
    );
  }
}
