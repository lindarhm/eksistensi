import 'package:flutter/material.dart';

class IconRounded extends StatelessWidget {
  final Color colorBackground;
  final String icon;
  final Color colorIcon;
  const IconRounded(
      {super.key,
      required this.colorBackground,
      required this.icon,
      required this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: colorBackground,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon == 'location'
              ? Icons.location_on
              : icon == 'account'
                  ? Icons.account_box_rounded
                  : Icons.menu,
          size: 18.0,
          color: colorIcon,
        ),
      ),
    );
  }
}
