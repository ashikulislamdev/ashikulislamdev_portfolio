import 'package:flutter/material.dart';

const cardBackgroundColor = Color(0xFF21222D);
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xFF15131C);
const selectionColor = Color(0xFF88B2AC);

const defaultPadding = 20.0;

// common text widget with style
Widget commonTextWidget(BuildContext context, String text) {
  return Expanded(
    child: Text(
      text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 4,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 668;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 992 &&
      MediaQuery.of(context).size.width >= 668;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 992;
}
