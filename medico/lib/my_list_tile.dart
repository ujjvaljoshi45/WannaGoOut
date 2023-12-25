import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final int id;
  final VoidCallback onClick;

  MyListTile({required this.title, required this.id, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      style: ListTileStyle.drawer,
      title: Text(title),
      subtitle: Text('ID: $id'),
      onTap: onClick,
    );
  }
}
