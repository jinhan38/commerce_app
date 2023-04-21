import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';

class CartViewModel extends ChangeNotifier {
  static final CartViewModel _cartViewModel = CartViewModel._singleton();

  factory CartViewModel() => _cartViewModel;

  CartViewModel._singleton();

  List<ProductModel> _productList = [];

  List<ProductModel> getList() => _productList;

  void update() => notifyListeners();

  void remove(ProductModel productModel) {

    List<ProductModel> tempProduct = [];
    for (var product in getList()) {
      if (product != productModel) {
        tempProduct.add(product);
      }
    }
    _productList = tempProduct;
    notifyListeners();
  }

  void add(ProductModel productModel) {
    _productList.add(productModel);
    update();
  }
}
