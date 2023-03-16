import 'package:commerce_app/screen/category/category_view_model.dart';
import 'package:commerce_app/screen/category/widget/category_widgets.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _viewModel = CategoryViewModel();
  final CategoryWidgets _widgets = CategoryWidgets();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _widgets.expansionTile(
            title: "패션",
            categories: _viewModel.fashion,
          ),
          _widgets.expansionTile(
            title: "음식",
            categories: _viewModel.food,
          ),
          _widgets.expansionTile(
            title: "가전",
            categories: _viewModel.living,
          ),
          _widgets.expansionTile(
            title: "뷰티",
            categories: _viewModel.beauty,
          ),
        ],
      ),
    );
  }
}
