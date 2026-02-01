import 'package:flutter/material.dart';
import 'package:provider_task/model/product.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProductData> _favorites = [];
  List<ProductData> get favorites => _favorites;
  bool isFavorite(ProductData id) => _favorites.contains(id);

  void toggleFavorite(ProductData id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }
}
