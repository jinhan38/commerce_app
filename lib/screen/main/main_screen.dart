import 'package:commerce_app/screen/home/home_screen.dart';
import 'package:commerce_app/screen/main/widgets/main_widgets.dart';
import 'package:flutter/material.dart';

import '../category/category_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CategoryScreen _categoryScreen = const CategoryScreen();
  final HomeScreen _homeScreen = const HomeScreen();
  final MainWidgets _mainWidgets = MainWidgets();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Fashion Commerce",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _homeScreen,
          _categoryScreen,
        ],
      ),
      bottomNavigationBar: _mainWidgets.navigationItems(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
      ),
    );
  }
}
