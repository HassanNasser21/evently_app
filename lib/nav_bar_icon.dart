import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarIcon extends StatelessWidget {
  String imagename;
  NavBarIcon({super.key, required this.imagename});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$imagename.svg',
      height: 24,
      width: 24,
      fit: BoxFit.scaleDown,
    );
  }
}
