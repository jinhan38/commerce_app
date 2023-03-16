import 'package:flutter/material.dart';

class CategoryWidgets {
  Widget expansionTile({
    required String title,
    required List<String> categories,
  }) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        textColor: Colors.black,
        initiallyExpanded: true,
        childrenPadding: EdgeInsets.zero,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        expandedAlignment: Alignment.centerLeft,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        children: List.generate(categories.length, (index) {
          return Container(
            alignment: Alignment.centerLeft,
            height: 40,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              categories[index],
              style: const TextStyle(fontSize: 16),
            ),
          );
        }),
      ),
    );
  }
}
