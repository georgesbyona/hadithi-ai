import 'dart:collection';

import 'package:flutter/material.dart';

import '../../data/data.dart';

class TalesProvider extends ChangeNotifier {
  int selectedIndex = 0;

  final List<String> _months = [
    "All",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  List<TaleModel> _miTales = TalesData.talesData;

  UnmodifiableListView<TaleModel> get miTales => UnmodifiableListView(_miTales);

  UnmodifiableListView<String> get months => UnmodifiableListView(_months);

  void changeMonth(int index) {
    selectedIndex = index;
    index == 0
        ? _miTales = TalesData.talesData
        : _miTales = TalesData.talesData
              .where((story) => story.month == _months[index].substring(0, 3))
              .toList();
    notifyListeners();
  }

  void makeItFav(TaleModel tale) {
    tale.favorite = !tale.favorite;
    notifyListeners();
  }

  bool isSaved = false;

  void saveIt(TaleModel savedTale) {
    final tale = TalesData.talesData.where((e) => e == savedTale).toList();
    isSaved = !isSaved;
    tale.first.isSaved = isSaved;
    notifyListeners();
  }
}
