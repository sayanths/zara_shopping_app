import 'package:flutter/cupertino.dart';
import 'package:food_delivery/core/styles/fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Color iconColor;
  final Color backgroundColor;
  final Color color;
  final String title;
  final IconData iconData;

  const CustomBottomNavBar({
    Key? key,
    required this.iconColor,
    required this.backgroundColor,
    required this.color,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: gFontsSans(fw: FontWeight.w400, cl: color),
            ),
          ],
        ),
      ),
    );
  }
}
