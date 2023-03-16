import 'package:commerce_app/asset_path.dart';
import 'package:commerce_app/model/product_model.dart';
import 'package:commerce_app/screen/home/home_view_model.dart';
import 'package:commerce_app/screen/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeWidgets widgets = HomeWidgets();
  final HomeViewModel _viewModel = HomeViewModel();


  /// 이벤트 배너 몇개 넣기
  /// 상세 페이지 만들기
  /// 카테고리 페이지 만들기 -> 텍스트로만

  @override
  void initState() {
    _viewModel.imageList.addAll(
      [
        AssetPath.cloth1,
        AssetPath.cloth2,
        AssetPath.cloth3,
        AssetPath.cloth4,
      ],
    );
    _viewModel.pageController = PageController()
      ..addListener(() {
        _viewModel.pageIndex.value = _viewModel.pageController.page!.round();
      });
    _viewModel.iconList.addAll(
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

    _viewModel.newProductList.addAll(
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
    _viewModel.popularProductList.addAll(
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// 이미지 페이지뷰
          widgets.pageView(
              pageController: _viewModel.pageController,
              imageList: _viewModel.imageList),
          const SizedBox(height: 10),

          /// 이미지 페이지뷰 인디캐이터
          widgets.indicator(
            length: _viewModel.imageList.length,
            pageIndex: _viewModel.pageIndex,
          ),

          const SizedBox(height: 20),
          widgets.shortCut(iconList: _viewModel.iconList),
          const SizedBox(height: 40),
          widgets.subTitle(text: "신제품"),
          widgets.productHorizontal(productList: _viewModel.newProductList),
          widgets.subTitle(text: "인기상품"),
          widgets.productHorizontal(productList: _viewModel.popularProductList),
        ],
      ),
    );
  }
}
