import 'package:commerce_app/screen/cart/cart_view_model.dart';
import 'package:commerce_app/screen/home/home_view_model.dart';
import 'package:commerce_app/screen/home/widgets/home_widgets.dart';
import 'package:flutter/cupertino.dart';

import '../../util.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final HomeWidgets _homeWidgets = HomeWidgets();
  final CartViewModel _cartViewModel = CartViewModel();
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    _cartViewModel.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_cartViewModel.getList().isEmpty) {
      return const Center(
        child: Text(
          "장바구니에 담긴 제품이 없습니다.",
          style: TextStyle(fontSize: 20),
        ),
      );
    }
    return _homeWidgets.productGrid(
      scroll: true,
      productList: _cartViewModel.getList(),
      onPressed: (productModel) {
        showToast("장바구니 제거");
        _cartViewModel.remove(productModel);
        for (var product in _homeViewModel.newProductList) {
          if (product == productModel) {
            product.cart = false;
            _homeViewModel.update();
            return;
          }
        }

        for (var product in _homeViewModel.popularProductList) {
          if (product == productModel) {
            product.cart = false;
            _homeViewModel.update();
            return;
          }
        }
      },
    );
  }
}
