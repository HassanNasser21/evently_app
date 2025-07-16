import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  String lable;
  VoidCallback? onpressed;
  DefaultElevatedButton({required this.lable, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 56)
      ),
      onPressed: onpressed,
      child: Text(lable, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
