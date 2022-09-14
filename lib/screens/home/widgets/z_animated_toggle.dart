//unimportant

import 'package:flutter/material.dart';
import 'package:intl/locale.dart';
import 'package:provider/provider.dart';

import '../../../providers/locale_provider.dart';
import '../../../config/theme/theme_getter.dart';

class ZAnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;

  const ZAnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
  }) : super(key: key);

  @override
  _ZAnimatedToggleState createState() => _ZAnimatedToggleState();
}

class _ZAnimatedToggleState extends State<ZAnimatedToggle> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LocaleProvider>(context);


    bool isEnglish= languageProvider.isEnglish;
    return SizedBox(
      width: width * .7,
      height: width * .13,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              widget.onToggleCallback(1);
            },
            child: Container(
              width: width * .7,
              height: width * .13,
              decoration: ShapeDecoration(
                  color: themeProvider.themeMode().toggleBackgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Row(
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .1),
                    child:  Text(
                      widget.values[isEnglish ?  index:1-index],//1 is for length of values -1 0 and 1 indexes
                      style: TextStyle(
                          fontSize: width * .05,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF918f95)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            alignment: themeProvider.isLightTheme
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: const Duration(milliseconds: 350),
            curve: Curves.ease,
            child: Container(
              alignment: Alignment.center,
              width: width * .35,
              height: width * .13,
              decoration: ShapeDecoration(
                  color: themeProvider.themeMode().toggleButtonColor,
                  shadows: themeProvider.themeMode().shadow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Text(
                themeProvider.isLightTheme
                    ? widget.values[0]
                    : widget.values[1],
                style: TextStyle(
                    fontSize: width * .045, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
