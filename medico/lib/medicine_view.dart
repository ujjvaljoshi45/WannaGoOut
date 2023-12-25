import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpHandler;
import 'package:medico/conditions.dart';
import 'package:medico/medicine.dart';

class MedicineView extends StatefulWidget {
  MedicineView({super.key, required this.conditions});
  Conditions conditions;

  @override
  State<MedicineView> createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  Conditions get conditions => widget.conditions;
  late Medicines medicine;
  Future<List<Map<String, dynamic>>> getMedicine() async {
    int medicineId = conditions.medicineId;
    var response = await httpHandler
        .get(Uri.parse('http://127.0.0.1:8000/?medicine=$medicineId'));
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
    List<Map<String, dynamic>> jsonMeds = await getMedicine();
    int id = await jsonMeds[0]['id'];
    String name = await jsonMeds[0]['name'];
    setState(() {
      medicine = Medicines(id, name);
    });
  }

  @override
  void initState() {
    updateUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicine.name),
      ),
      body: Center(
        child: Text(medicine.name),
      ),
    );
  }
}
