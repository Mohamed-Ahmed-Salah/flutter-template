import 'package:flutter/material.dart';
import 'package:flutter_template/providers/bottom_nav_provider.dart';
import 'package:flutter_template/repository/test%20repo/post_change_provider.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/l10n/l10n.dart';
import 'providers/locale_provider.dart';
import 'config/route/route_constants.dart';
import 'package:flutter_template/config/route/router.dart' as router;

import 'config/theme/theme_getter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);

  //setting up the theme
  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;
  bool isEnglish = settings.get('isEnglish') ?? true;
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LocaleProvider(isEnglish: isEnglish),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(isLightTheme: isLightTheme),
          ),
          ChangeNotifierProvider(
            create: (_) => BottomNavProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => PostChangeNotifier(), //TODO REMOVE
          ),
        ],
        builder: (_, child) {
          return const AppStart();
        }),
  );
}

// to ensure we have the themeProvider before the app starts lets make a few more changes.

class AppStart extends StatelessWidget {
  const AppStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //used here so i can access it later in material app
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LocaleProvider>(context);

    return MyApp(
      themeProvider: themeProvider,
      languageProvider: languageProvider,
    );
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;
  final LocaleProvider languageProvider;

  const MyApp(
      {Key? key, required this.themeProvider, required this.languageProvider})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: L10n.all,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      title: 'Light Dark Theme',
      locale: widget.languageProvider.isEnglish
          ? const Locale('en', '')
          : const Locale('ar', ''),
      theme: widget.themeProvider.themeData(),
      //home: Testing(),
      // darkTheme:  CustomDarkTheme().darkTheme(),
      onGenerateRoute: router.generateRoute,
      initialRoute: navScreenRoute,
    );
  }
}
// Theme Data is saved on refresh or restart
