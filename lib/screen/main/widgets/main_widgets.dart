import 'package:flutter/material.dart';

class MainWidgets {
  BottomNavigationBar navigationItems({
    required int currentIndex,
    required Function(int value) onTap,
  }) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: '카테고리',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      onTap: (value) {
        onTap(value);
      },
    );
  }
}
