import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgIcon extends StatelessWidget {
  const CustomSvgIcon({Key? key, this.color, required this.src})
      : super(key: key);
  final String src;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      src,
      height: 24,
      color: color ??
          Theme.of(context).iconTheme.color!.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
    );
  }
}
