import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  String? prefixIconImageName;
  TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  CustomTextFormField({
    required this.hintText,
    this.prefixIconImageName,
    this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
