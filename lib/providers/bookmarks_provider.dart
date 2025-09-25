import 'package:flutter/material.dart';
import 'package:travel_app_ui/Model/model.dart';

class BookmarksProvider with ChangeNotifier {
  final List<LocationDetail> _bookmarkedLocations = [];

  List<LocationDetail> get bookmarkedLocations => _bookmarkedLocations;

  bool isBookmarked(LocationDetail location) {
    return _bookmarkedLocations.contains(location);
  }

  void toggleBookmark(LocationDetail location) {
    if (isBookmarked(location)) {
      _bookmarkedLocations.remove(location);
    } else {
      _bookmarkedLocations.add(location);
    }
    notifyListeners();
  }
}
