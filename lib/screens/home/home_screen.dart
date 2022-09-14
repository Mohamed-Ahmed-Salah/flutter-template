import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/locale_provider.dart';
import 'widgets/z_animated_toggle.dart';
import '../../config/route/route_constants.dart';
import '../../config/theme/theme_getter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    /*_animationController.addStatusListener((status) {
      print(_animationController.value);
    });*/
    super.initState();
  }

  // function to toggle circle animation
  changeThemeMode(bool theme) {
    if (!theme) {
      _animationController.forward(from: 0.0);
    } else {
      _animationController.reverse(from: 1.0);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Now we have access to the theme properties
    final themeProvider = Provider.of<ThemeProvider>(context);
    final language = Provider.of<LocaleProvider>(context);

    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        centerTitle: true,
        title: const Text("App Dropdown Menu"),
        actions: [
          //list if widget in appbar actions
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            //don't specify icon if you want 3 dot menu
            // color: Colors.blue,
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: "English", //could be changed to enums laters
                child: Text(
                  "English",
                ),
              ),
              const PopupMenuItem<String>(
                value: "Arabic",
                child: Text(
                  "العربيه",
                ),
              ),
            ],
            onSelected: (item) {
              print('hiiiiiiii');
              if (item == "English" && language.isEnglish) {
                language.changeLanguage();
              } else if (item == 'Arabic' && !language.isEnglish) {
                language.changeLanguage();
              } else {
                language.changeLanguage();
              }
            },
          ),
        ],
      ), //appbar end
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: height * 0.1),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: width * 0.35,
                    height: width * 0.35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: themeProvider.themeMode().gradient,
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                        language.isEnglish  ? 50 : 15, 0),
                    child: ScaleTransition(
                      scale: _animationController.drive(
                        Tween<double>(begin: 0.0, end: 1.0).chain(
                          CurveTween(curve: Curves.decelerate),
                        ),
                      ),
                      alignment: Alignment.topRight,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: width * .26,
                        height: width * .26,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeProvider.isLightTheme
                              ? Colors.white
                              : const Color(0xFF26242e),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.1),
              Text(
                AppLocalizations.of(context)!.style,
                style: TextStyle(
                    fontSize: width * .06, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: width * .6,
                child: Text(
                  AppLocalizations.of(context)!.pop,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.1),
              ZAnimatedToggle(
                values: [
                  AppLocalizations.of(context)!.light,
                  AppLocalizations.of(context)!.dark
                ],
                onToggleCallback: (v) async {
                  // print(AppLocalizations.of(context)!.light);
                  await themeProvider.toggleThemeData();
                  // setState(() {});
                  changeThemeMode(themeProvider.isLightTheme);
                },
              ),
              SizedBox(
                height: height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildDot(
                    width: width * 0.022,
                    height: width * 0.022,
                    color: const Color(0xFFd9d9d9),
                  ),
                  buildDot(
                    width: width * 0.055,
                    height: width * 0.022,
                    color: themeProvider.isLightTheme
                        ? const Color(0xFF26242e)
                        : Colors.white,
                  ),
                  buildDot(
                    width: width * 0.022,
                    height: width * 0.022,
                    color: const Color(0xFFd9d9d9),
                  ),
                ],
              ),
              // skip & next
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.04),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.025),
                        child: GestureDetector(
                          onTap: () {
                            //  ModalRoute.withName(homeScreenRoute);
                            Navigator.pushNamed(context, page1ScreenRoute);
                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const Page1())
                                );*/
                            // ModalRoute.withName(homeScreenRoute)
                          },
                          child: Text(
                            '${AppLocalizations.of(context)!.skip}',
                            style: TextStyle(
                              fontSize: width * 0.045,
                              color: const Color(0xFF7c7b7e),
                              fontFamily: 'Rubik',
                            ),
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Loved it? Give a star on Github',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: width * 0.045,
                                ),
                              ),
                            ),
                          );
                        },
                        shape: const CircleBorder(),
                        color: themeProvider.isLightTheme
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF35303f),
                        child: Icon(
                          Icons.arrow_forward,
                          color: themeProvider.isLightTheme
                              ? const Color(0xFF000000)
                              : const Color(0xFFFFFFFF),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /*  ElevatedButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.hiKing),
              ),

              TextButton(
                onPressed: () {},
                child: Text(AppLocalizations.of(context)!.hiKing),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

// for drawing the dots
  Container buildDot({double? width, double? height, Color? color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: width ?? 0,
      height: height ?? 0,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color ?? Colors.red,
      ),
    );
  }
}

// #time for finishing touches! I
