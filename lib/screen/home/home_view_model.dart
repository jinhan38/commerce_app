import 'package:commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';

import '../../asset_path.dart';

class HomeViewModel extends ChangeNotifier {
  static final HomeViewModel _homeViewModel = HomeViewModel._singleton();

  factory HomeViewModel() => _homeViewModel;

  HomeViewModel._singleton();

  late final PageController pageController;
  final List<String> imageList = [];
  final List<String> iconList = [];
  final List<ProductModel> newProductList = [];
  final List<ProductModel> popularProductList = [];
  final List<Widget> widgetList = [];
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  void update() => notifyListeners();

  void init() {
    imageList.addAll(
      [
        AssetPath.cloth1,
        AssetPath.cloth2,
        AssetPath.cloth3,
        AssetPath.cloth4,
      ],
    );
    pageController = PageController()
      ..addListener(() {
        pageIndex.value = pageController.page!.round();
      });
    iconList.addAll(
      [
        AssetPath.jacket,
        AssetPath.jumper,
        AssetPath.necklace,
        AssetPath.bag,
        AssetPath.cap,
        AssetPath.skirt,
        AssetPath.trousers,
        AssetPath.shirt,
      ],
    );

    newProductList.addAll(
      [
        ProductModel(
            image: AssetPath.productJacketJean,
            name: "청 자켓",
            price: 90000,
            like: false,
            reviewCount: 27,
            reviewRating: 4.1),
        ProductModel(
            image: AssetPath.productShoes,
            name: "나이키 신발",
            price: 190000,
            like: false,
            reviewCount: 19,
            reviewRating: 3.9),
        ProductModel(
            image: AssetPath.productManJacket,
            name: "남성 자켓 ",
            price: 220000,
            like: true,
            reviewCount: 0,
            reviewRating: 0),
        ProductModel(
            image: AssetPath.productManStreet,
            name: "길거리 패션",
            price: 73000,
            like: false,
            reviewCount: 5,
            reviewRating: 3.3),
      ],
    );
    popularProductList.addAll(
      [
        ProductModel(
            image: AssetPath.productBag,
            name: "샤넬 가방",
            price: 2500000,
            like: true,
            reviewCount: 71,
            reviewRating: 4.6),
        ProductModel(
            image: AssetPath.productWomen,
            name: "여성 패션",
            price: 99000,
            like: true,
            reviewCount: 64,
            reviewRating: 4.8),
        ProductModel(
            image: AssetPath.productManSuit,
            name: "남성 정장",
            price: 350000,
            like: false,
            reviewCount: 35,
            reviewRating: 4.0),
      ],
    );
  }
}
