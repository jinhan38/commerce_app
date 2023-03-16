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
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
        const SizedBox(width: 24),
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

  Widget productHorizontal({required List<ProductModel> productList}) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 24,right: 24,top: 20),
        itemBuilder: (context, index) {
          ProductModel product = productList[index];
          return SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  product.image,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.fill,
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
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
        itemCount: productList.length,
      ),
    );
  }
}
