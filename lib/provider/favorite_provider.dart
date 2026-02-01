import 'package:flutter/material.dart';

class FavoriteProvider  extends ChangeNotifier{
  final Set<int> _favorites = {};

  bool isFavorite(int id) => _favorites.contains(id);

  void toggleFavorite(int id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }
}