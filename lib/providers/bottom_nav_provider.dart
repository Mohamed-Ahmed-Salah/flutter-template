import 'package:flutter/material.dart';

import '../enums/nav_item_enum.dart';

class BottomNavProvider extends ChangeNotifier {
  BottomNavItemEnum _selectedNavItem = BottomNavItemEnum.shop;

  get selectedItem => _selectedNavItem;

  updateSelectedNavIndex(BottomNavItemEnum item) {
    if (item != _selectedNavItem) {
      _selectedNavItem = item;
      notifyListeners();
    }
  }
}
