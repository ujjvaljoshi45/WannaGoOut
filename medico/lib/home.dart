import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medico/Infections.dart';
import 'package:medico/condition_view.dart';
import 'package:medico/my_list_tile.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> myList = [];
  @override
  void initState() {
    updateUI();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: Column(
            children: [
              const MyAgeSelector(),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return myList[index];
                  },
                  itemCount: myList.length,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getInfections() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8000/'));
    print(response.body);
    List<dynamic> data = jsonDecode(response.body);
    List<Map<String, dynamic>> listOfjson = [];
    for (dynamic jsonObject in data) {
      if (jsonObject is Map<String, dynamic>) {
        listOfjson.add(jsonObject);
      }
    }
    return listOfjson;
  }

  void updateUI() async {
    List<Map<String, dynamic>> listOfJson = await getInfections();
    print('Got Data ');
    Infections infection = Infections.fromJson(listOfJson[0]);
    print(infection.name);

    for (Map<String, dynamic> json in listOfJson) {
      Infections infection = Infections.fromJson(json);
      setState(() {
        myList.add(MyListTile(
          title: infection.name,
          id: infection.id,
          onClick: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConditionView(
                  infection: infection,
                ),
              ),
            );
          },
        ));
      });
    }

    // Maually getting json
    /*
    for (Map<String, dynamic> json in listOfJson) {
      int id = await json['id'];
      String name = await json['name'];
      int conditionId = await json['conditionId_id'];
      Infections infection = Infections(1, name, conditionId);
      setState(() {
        myList.add(MyListTile(
          title: infection.name,
          id: infection.id,
          onClick: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConditionView(
                  infection: infection,
                ),
              ),
            );
          },
        ));
      });
    } */
  }
}

class MyAgeSelector extends StatefulWidget {
  const MyAgeSelector({super.key});

  @override
  State<MyAgeSelector> createState() => _MyAgeSelectorState();
}

class _MyAgeSelectorState extends State<MyAgeSelector> {
  @override
  int _curVal = 20;
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Select Age",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  _curVal--;
                });
              },
              elevation: 2.0,
              fillColor: Colors.white,
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.remove,
                size: 35.0,
              ),
            ),
            NumberPicker(
                minValue: 0,
                maxValue: 100,
                value: _curVal,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                onChanged: (newVal) {
                  setState(() {
                    _curVal = newVal;
                  });
                }),
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  _curVal++;
                });
              },
              elevation: 2.0,
              fillColor: Colors.white,
              padding: const EdgeInsets.all(15.0),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: 35.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
