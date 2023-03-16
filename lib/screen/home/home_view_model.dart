import 'package:commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  static final HomeViewModel _homeViewModel = HomeViewModel._singleton();

  factory HomeViewModel() => _homeViewModel;

  HomeViewModel._singleton();

  late final PageController pageController;

  final List<String> imageList = [];
  final List<String> iconList = [];
  final List<ProductModel> newProductList = [];
  final List<ProductModel> popularProductList = [];


  final ValueNotifier<int> pageIndex = ValueNotifier(0);
}
