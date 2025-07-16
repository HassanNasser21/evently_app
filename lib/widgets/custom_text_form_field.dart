import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  String? prefixIconImageName;
  TextEditingController? controller;
  void Function(String)? onChanged;
  CustomTextFormField({
    required this.hintText,
    this.prefixIconImageName,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIconImageName != null
            ? SvgPicture.asset(
                'assets/icons/$prefixIconImageName.svg',
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              )
            : null,
      ),
    );
  }
}
