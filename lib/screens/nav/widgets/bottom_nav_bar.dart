import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../screens.dart';
import '../../../constants.dart';
import 'widgets.dart';
import '../../../enums/nav_item_enum.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int) onTap;
  Map<BottomNavItemEnum, String> items;
  BottomNavItemEnum selectedItem;

  BottomNavBar(
      {Key? key, required this.onTap, required this.items,
        required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: BottomNavItemEnum.values.indexOf(selectedItem),
      onTap: onTap,
      backgroundColor: Theme
          .of(context)
          .brightness == Brightness.light
          ? whiteColor
          :  bottomNavBarColor,
      type: BottomNavigationBarType.fixed,
      // selectedLabelStyle: TextStyle(color: primaryColor),
      selectedFontSize: 12,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.transparent,
      items: const [
        BottomNavigationBarItem(

          icon: CustomSvgIcon( src:"assets/icons/Shop.svg"),
          activeIcon: CustomSvgIcon( src: "assets/icons/Shop.svg", color: primaryColor),
          label: "Shop",
        ),
        BottomNavigationBarItem(
          icon: CustomSvgIcon( src:"assets/icons/Category.svg"),
          activeIcon:
          CustomSvgIcon( src:"assets/icons/Category.svg", color: primaryColor),
          label: "Discover",
        ),
        BottomNavigationBarItem(
          icon: CustomSvgIcon( src:"assets/icons/Bookmark.svg"),
          activeIcon:
          CustomSvgIcon( src:"assets/icons/Bookmark.svg", color: primaryColor),
          label: "Bookmark",
        ),
        BottomNavigationBarItem(
          icon: CustomSvgIcon( src:"assets/icons/Bag.svg"),
          activeIcon: CustomSvgIcon( src:"assets/icons/Bag.svg", color: primaryColor),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: CustomSvgIcon( src:"assets/icons/Profile.svg"),
          activeIcon:
          CustomSvgIcon( src:"assets/icons/Profile.svg", color: primaryColor),
          label: "Profile",
        ),
      ],
    );
  }
}
