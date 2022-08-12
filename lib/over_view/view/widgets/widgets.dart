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

class SmallMeduimSizeNotifyWidget extends StatelessWidget {
  final String title;
  const SmallMeduimSizeNotifyWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
