import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatefulWidget {
  String hintText;
  String? prefixIconImageName;
  TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  bool ispassword;
  CustomTextFormField({
    required this.hintText,
    this.prefixIconImageName,
    this.controller,
    this.onChanged,
    this.validator,
    this.ispassword = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
 late bool isobscure = widget.ispassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isobscure,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIconImageName != null
            ? SvgPicture.asset(
                'assets/icons/${widget.prefixIconImageName}.svg',
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              )
            : null,
        suffixIcon: widget.ispassword
            ? IconButton(
                onPressed: () {
                  isobscure = !isobscure;
                  setState(() {
                    
                  });
                },
                icon: Icon(
                  isobscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                color: AppTheme.gray,
              )
            : null,
      ),
    );
  }
}
