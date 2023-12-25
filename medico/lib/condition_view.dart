import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medico/Infections.dart';
import 'package:http/http.dart' as httpHandler;
import 'package:medico/conditions.dart';
import 'package:medico/medicine_view.dart';
import 'package:medico/my_list_tile.dart';

class ConditionView extends StatefulWidget {
  ConditionView({super.key, required this.infection});
  Infections infection;

  @override
  State<ConditionView> createState() => _ConditionViewState();
}

class _ConditionViewState extends State<ConditionView> {
  Infections get infection => widget.infection;
  List<Widget> myList = [];

  get http => null;
  @override
  void initState() {
    updateUi();
    super.initState();
  }

  Future<List<Map<String, dynamic>>> getCondition() async {
    int conditionId = infection.conditionId;
    print("Calling URL");
    var response = await httpHandler
        .get(Uri.parse('http://127.0.0.1:8000/?condition=$conditionId'));
    print("URL Called");
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

  void updateUi() async {
    var jsonConditions = await getCondition();
    for (Map<String, dynamic> json in jsonConditions) {
      Conditions condition = Conditions.fromJson(json);
      setState(() {
        myList.add(MyListTile(
          title: condition.name,
          id: condition.id,
          onClick: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MedicineView(
                  conditions: condition,
                ),
              ),
            );
          },
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(infection.name),
        ),
        body: Column(children: [
          Text('${infection.name}'),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return myList[index];
              },
              itemCount: myList.length,
            ),
          ),
        ]));
  }
}
