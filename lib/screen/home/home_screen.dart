import 'package:commerce_app/asset_path.dart';
import 'package:commerce_app/screen/cart/cart_view_model.dart';
import 'package:commerce_app/screen/home/home_view_model.dart';
import 'package:commerce_app/screen/home/widgets/home_widgets.dart';
import 'package:commerce_app/util.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeWidgets widgets = HomeWidgets();
  final HomeViewModel _viewModel = HomeViewModel();
  final CartViewModel _cartViewModel = CartViewModel();

  /// 이벤트 배너 몇개 넣기
  /// 상세 페이지 만들기
  /// 카테고리 페이지 만들기 -> 텍스트로만

  @override
  void initState() {
    _viewModel.init();
    _viewModel.addListener(() {
      setState(() {});
    });
    _viewModel.widgetList.addAll([
      /// 이미지 페이지뷰
      widgets.pageView(
          pageController: _viewModel.pageController,
          imageList: _viewModel.imageList),
      const SizedBox(height: 20),

      /// 이미지 페이지뷰 인디캐이터
      widgets.indicator(
        length: _viewModel.imageList.length,
        pageIndex: _viewModel.pageIndex,
      ),

      const SizedBox(height: 30),
      widgets.shortCut(iconList: _viewModel.iconList),
      const SizedBox(height: 40),
      widgets.subTitle(text: "신제품"),
      widgets.productHorizontal(
        productList: _viewModel.newProductList,
        onPressed: (productModel) {
          if (!productModel.cart) {
            showToast("장바구니 추가");
            productModel.cart = true;
            _cartViewModel.add(productModel);
          }
        },
      ),
      widgets.subTitle(text: "인기상품"),
      widgets.productHorizontal(
        productList: _viewModel.popularProductList,
        onPressed: (productModel) {
          if (!productModel.cart) {
            showToast("장바구니 추가");
            productModel.cart = true;
            _cartViewModel.add(productModel);
          }
        },
      ),
      const SizedBox(height: 30),
      widgets.subTitle(text: "이벤트"),
      const SizedBox(height: 10),
      widgets.event(eventImage: AssetPath.event),
      const SizedBox(height: 60),
      widgets.subTitle(text: "오늘만 할인"),
      const SizedBox(height: 20),
      widgets.productGrid(
        productList: _viewModel.newProductList,
        onPressed: (productModel) {
          if (!productModel.cart) {
            showToast("장바구니 추가");
            productModel.cart = true;
            _cartViewModel.add(productModel);
          }
        },
      ),
      widgets.subTitle(text: "시즌 행사"),
      const SizedBox(height: 20),
      widgets.productGrid(
        productList: _viewModel.popularProductList,
        onPressed: (productModel) {
          if (!productModel.cart) {
            showToast("장바구니 추가");
            productModel.cart = true;
            _cartViewModel.add(productModel);
          }
        },
      ),
      const SizedBox(height: 40),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// SingleScrollView, ListView, ListView.builder 성능 차이 비교할 것
    /// SingleScrollView, ListView 로 하면 스크롤 할 때 좀 무겁다.
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _viewModel.widgetList[index];
      },
      itemCount: _viewModel.widgetList.length,
    );
  }
}
