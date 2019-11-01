import 'package:flutter/foundation.dart';

enum Category {
  all,
  noodles,
  vegetarian,
}

class Product {
  const Product({
    @required this.category,
    @required this.id,
    @required this.isFeatured,
    @required this.name,
    @required this.thumbnail,
    @required this.price,
  })  : assert(category != null),
        assert(id != null),
        assert(isFeatured != null),
        assert(name != null),
        assert(price != null);

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final String thumbnail;
  final double price;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => '$name (id=$id)';

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id:  json['id'],
      category:  Category.all,
      isFeatured: true,
      name: json['name'],
      thumbnail: json['thumbnail'],
      price: json['energyUnit'],
    );
  }
}