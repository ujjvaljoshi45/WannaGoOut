import 'package:easypg/views/property_tile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PropertyView extends StatelessWidget {
  PropertyView({super.key});
  List<Widget> propertyList = <Widget>[
    const PropertyTile(),
    const PropertyTile(),
    const PropertyTile(),
    const PropertyTile(),
    const PropertyTile(),
    const PropertyTile()
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Options goes here ........'),
            ),
            Expanded(
              child: ListView(
                controller: ScrollController(),
                scrollDirection: Axis.vertical,
                children: propertyList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
