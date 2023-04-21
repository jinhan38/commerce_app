import 'package:commerce_app/util.dart';
import 'package:flutter/material.dart';

import '../../../model/product_model.dart';

class HomeWidgets {
  Widget pageView({
    required PageController pageController,
    required List<String> imageList,
  }) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return Image.asset(
            imageList[index],
            fit: BoxFit.cover,
          );
        },
        itemCount: imageList.length,
      ),
    );
  }

  Widget indicator({
    required int length,
    required ValueNotifier<int> pageIndex,
  }) {
    return ValueListenableBuilder(
      valueListenable: pageIndex,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            length,
            (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: index == pageIndex.value ? 20 : 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: index == pageIndex.value
                      ? Colors.grey
                      : Colors.grey.shade300,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget shortCut({required List<String> iconList}) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: List.generate(iconList.length, (index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  maximumSize: const Size(70, 70),
                  padding: const EdgeInsets.all(16),
                  elevation: 0,
                  backgroundColor: const Color(0xffFFE0C4),
                  foregroundColor: Colors.grey),
              child: Image.asset(
                iconList[index],
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget subTitle({required String text}) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget productHorizontal({
    required List<ProductModel> productList,
    required Function(ProductModel productModel) onPressed,
  }) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        itemBuilder: (context, index) {
          ProductModel product = productList[index];
          return GestureDetector(
            onTap: () => onPressed(product),
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    product.image,
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("${nFormat.format(product.price)}원"),
                  Text("평점 ${product.reviewRating} (${product.reviewCount})"),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
        itemCount: productList.length,
      ),
    );
  }

  Widget productGrid({
    required List<ProductModel> productList,
    required Function(ProductModel productModel) onPressed,
    bool scroll = false,
  }) {
    return GridView.count(
      physics: scroll
          ? const ClampingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.6,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      crossAxisSpacing: 16,
      children: List.generate(productList.length, (index) {
        ProductModel product = productList[index];
        return GestureDetector(
          onTap: () => onPressed(product),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                product.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 4),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text("${nFormat.format(product.price)}원"),
              Text("평점 ${product.reviewRating} (${product.reviewCount})"),
            ],
          ),
        );
      }),
    );
  }

  Widget event({required String eventImage}) {
    return Image.asset(
      eventImage,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
