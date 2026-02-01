import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductData {
 final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  ProductData({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'thumbnail': image,
    };
  }

  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductData.fromJson(String source) => ProductData.fromMap(json.decode(source) as Map<String, dynamic>);
}
