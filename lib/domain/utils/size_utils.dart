import 'package:flutter/material.dart';

class SizeUtils {
  static bool canFitted(BuildContext context) =>
      isMedium(context) ||
      isExpanded(context) ||
      isLarge(context) ||
      isExtraLarge(context);

  static bool isCompact(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600;
  }

  static bool isMedium(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 600 &&
        MediaQuery.sizeOf(context).width < 840;
  }

  static bool isExpanded(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 840 &&
        MediaQuery.sizeOf(context).width < 1200;
  }

  static bool isLarge(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1200 &&
        MediaQuery.sizeOf(context).width < 1600;
  }

  static bool isExtraLarge(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1600;
  }
}
