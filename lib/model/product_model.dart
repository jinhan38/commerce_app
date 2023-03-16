class ProductModel {
  String image;
  String name;
  int price;
  bool like;
  int reviewCount;
  double reviewRating;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.like,
    required this.reviewCount,
    required this.reviewRating,
  });

  @override
  String toString() {
    return 'ProductModel{image: $image, name: $name, price: $price, '
        'like: $like, reviewCount: $reviewCount, reviewRating: $reviewRating}';
  }
}
