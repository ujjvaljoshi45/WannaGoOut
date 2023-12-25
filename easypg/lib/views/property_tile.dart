import 'package:easypg/views/property_detail_view.dart';
import 'package:flutter/material.dart';

class PropertyTile extends StatelessWidget {
  const PropertyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PropertyDetialView.routeName);
      },
      child: Card(
        elevation: 2,
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/logo.png', height: 100, width: 100),
                const SizedBox(width: 14),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Property Name'),
                    Text('Property Address'),
                    Text('Property Rent'),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
