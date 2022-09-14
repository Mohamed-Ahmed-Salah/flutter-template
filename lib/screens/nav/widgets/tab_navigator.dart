import 'package:flutter/material.dart';


import '../../../config/route/route_constants.dart';
import '../../../enums/nav_item_enum.dart';
import '../../../config/route/router.dart' as router;
import '../../profile/profile.dart';
import '../../screens.dart';
class TabNavigator extends StatelessWidget {
  /*TabNavigator(
  navigatorKey: navKeys[currentItem],
  item: currentItem,
  ),*/

  final BottomNavItemEnum item;
  final GlobalKey<NavigatorState> navigatorKey;

  const TabNavigator({Key? key, required this.item, required this.navigatorKey})
      : super(key: key);

  //static const String tabNavigatorRoot = '/';

  @override
  Widget build(BuildContext context) {
    final routeBuilder = _routeBuilder(context, item);
    return Navigator(
      key: navigatorKey,
      initialRoute: navScreenRoute, //todo to be change
      // onGenerateRoute: router.generateRoute,
      onGenerateRoute: (initialRoute) {
        return _getScreen(context, item);
      },
    );
  }

  Map<String, WidgetBuilder> _routeBuilder(
      BuildContext context, BottomNavItemEnum item) {
    return {navScreenRoute: (context) => _getScreen(context, item)};
  }

  _getScreen(BuildContext context, BottomNavItemEnum item) {
    switch (item) {
      case BottomNavItemEnum.shop:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case BottomNavItemEnum.discover:
        return MaterialPageRoute(
          builder: (context) => Page2(),
        );
      case BottomNavItemEnum.bookmark:
        return MaterialPageRoute(
          builder: (context) => const Page3(),
        );
      case BottomNavItemEnum.cart:
        return MaterialPageRoute(
          builder: (context) => const Page1(),
        );

      case BottomNavItemEnum.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      default:
        return MaterialPageRoute(
          // Make a screen for undefine
          builder: (context) => Testing(),
        );
    }
  }
}
