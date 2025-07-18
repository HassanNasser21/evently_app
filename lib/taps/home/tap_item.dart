import 'package:flutter/material.dart';

class TapItem extends StatelessWidget {
  String label;
  IconData icon;
  bool isselected;
  Color selectedbackgroundcolor;
  Color selectedforegroundcolor;
  Color unselectedforegroundcolor;
  TapItem({
    required this.label,
    required this.icon,
    required this.isselected,
    required this.selectedbackgroundcolor,
    required this.selectedforegroundcolor,
    required this.unselectedforegroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isselected ? selectedbackgroundcolor : Colors.transparent,
        border: BoxBorder.all(color: unselectedforegroundcolor),
        borderRadius: BorderRadius.circular(46),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: isselected
                ? selectedforegroundcolor
                : unselectedforegroundcolor,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isselected
                  ? selectedforegroundcolor
                  : unselectedforegroundcolor,
            ),
          ),
        ],
      ),
    );
  }
}
