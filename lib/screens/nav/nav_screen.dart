import 'package:flutter/material.dart';
import '../../providers/bottom_nav_provider.dart';
import '../screens.dart';
import 'widgets/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/config/route/router.dart' as router;
import '../../constants.dart';
import '../../enums/nav_item_enum.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _pages = const[
    HomeScreen(),
    Page1(),
    Page2(),
    Page3(),
    ProfileScreen(),
    // ProfileScreen(),
  ];

  //todo use persistant.....
  final Map<BottomNavItemEnum, String> items = {
    BottomNavItemEnum.shop: "assets/icons/Shop.svg",
    BottomNavItemEnum.bookmark: "assets/icons/Bookmark.svg",
    BottomNavItemEnum.cart: "assets/icons/Bag.svg",
    BottomNavItemEnum.profile: "assets/icons/Profile.svg",
    BottomNavItemEnum.discover: "assets/icons/Category.svg",
  };

  final Map<BottomNavItemEnum, GlobalKey<NavigatorState>> navKeys = {
    BottomNavItemEnum.shop: GlobalKey<NavigatorState>(),
    BottomNavItemEnum.bookmark: GlobalKey<NavigatorState>(),
    BottomNavItemEnum.cart: GlobalKey<NavigatorState>(),
    BottomNavItemEnum.profile: GlobalKey<NavigatorState>(),
    BottomNavItemEnum.discover: GlobalKey<NavigatorState>(),
  };

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.skateboarding),
        title: "Shop",
        iconSize: 20,
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: const CustomSvgIcon(
          src: "assets/icons/Shop.svg",
        ),
        inactiveColorPrimary: Colors.grey,
        /* title: ("Home"),*/
      ),
      PersistentBottomNavBarItem(
        icon: const CustomSvgIcon(src: "assets/icons/Shop.svg", color: primaryColor),
        title: "Shop",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: const CustomSvgIcon(
          src: "assets/icons/Shop.svg",
        ),
        inactiveColorPrimary: Colors.grey,
        /* title: ("Home"),*/
      ),
      PersistentBottomNavBarItem(
        icon: const CustomSvgIcon(src: "assets/icons/Shop.svg", color: primaryColor),
        title: "Shop",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: const CustomSvgIcon(
          src: "assets/icons/Shop.svg",
        ),
        inactiveColorPrimary: Colors.grey,
        /* title: ("Home"),*/
      ),
      PersistentBottomNavBarItem(
        icon: const CustomSvgIcon(src: "assets/icons/Shop.svg", color: primaryColor),
        title: "Shop",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: const CustomSvgIcon(
          src: "assets/icons/Shop.svg",
        ),
        inactiveColorPrimary: Colors.grey,
        /* title: ("Home"),*/
      ),
      PersistentBottomNavBarItem(
        icon: const CustomSvgIcon(src: "assets/icons/Shop.svg", color: primaryColor),
        title: "Shop",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: const CustomSvgIcon(
          src: "assets/icons/Shop.svg",
        ),
        inactiveColorPrimary: Colors.grey,
        /* title: ("Home"),*/
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = PersistentTabController(initialIndex: 0);
    _controller.addListener(() {
      // print('controller: ${_controller.index}');
      final selectedItem = BottomNavItemEnum.values[_controller.index];
      _selectBottomNavItem(context, selectedItem,
          sameItem: false, from: 'controller', index: _controller.index);
    });
    super.initState();
  }

  late PersistentTabController _controller;

  @override
  Widget build(BuildContext context) {
    // print('object');
    return Consumer<BottomNavProvider>(
      builder: (context, provider, _) {
        // print('builder');
        //pachage bottom nav bar
        // good thing only loads page when opened!
        return PersistentTabView.custom(
          context,
          handleAndroidBackButtonPress: true,
          routeAndNavigatorSettings:
              const CutsomWidgetRouteAndNavigatorSettings(
                  onGenerateRoute: router.generateRoute),
          controller: _controller,
          screens: _pages,
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          /* items: _navBarsItems(),
          navBarStyle: NavBarStyle.style2,*/
          itemCount: 5,
          customWidget: BottomNavBar(
            items: items,
            onTap: (index) {
              //  print('hina first');
              if (_controller.index == index) {
                // print('!!!!!');
                print('no change');
                return;
              }
              _controller.index = index;
             /* final selectedItem = BottomNavItemEnum.values[index];

              _selectBottomNavItem(context, selectedItem,
                  sameItem: selectedItem == provider.selectedItem,
                  from: 'nav',
                  index: index);*/
            },
            selectedItem: provider.selectedItem,
          ),
        );

        //custom persistant bottom nav bar
        //loads all pages at startup,
        /*  return Scaffold(
          //   body: _pages[BottomNavItemEnum.values.indexOf(provider.selectedItem)],

          body: Stack(
            children: items
                .map(
                  (item, _) => MapEntry(
                    item,
                    _buildOffstageNavigator(
                        item, item == provider.selectedItem),
                  ),
                )
                .values
                .toList(),
          ),
          bottomNavigationBar: BottomNavBar(
            items: items,
            onTap: (index) {
              final selectedItem = BottomNavItemEnum.values[index];

              _selectBottomNavItem(
                  context, selectedItem, selectedItem == provider.selectedItem);
            },
            selectedItem: provider.selectedItem,
          ),
        );*/
      },
    );
  }

  _selectBottomNavItem(BuildContext context, BottomNavItemEnum selectedItem,
      {bool sameItem = false, required String from, required int index}) {
    print('update $from');
    if (sameItem) {
      print('sssssssssaaaammmmeeeeeee $from');
      navKeys[selectedItem]?.currentState?.popUntil((route) => route.isFirst);
      // print('!!!!!');
    } else {
      print('!!!!! $from');

      _controller.index = index;
      context.read<BottomNavProvider>().updateSelectedNavIndex(selectedItem);
    }
  }

  Widget _buildOffstageNavigator(
      BottomNavItemEnum currentItem, bool isSelected) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navKeys[currentItem] ?? GlobalKey<NavigatorState>(),
        item: currentItem,
      ),
    );
  }
}
