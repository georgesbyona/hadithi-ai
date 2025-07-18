import 'package:flutter/material.dart';

import '../ui.dart';

void miSnackBar(
  BuildContext context, {
  bool isError = true,
  double horizontalMargin = 50,
  String text = "Error occurred!",
}) {
  final textTheme = Theme.of(context).textTheme;
  final colorScheme = Theme.of(context).colorScheme;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError ? colorScheme.errorContainer : Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(
          color: isError ? colorScheme.errorContainer : Colors.green,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 10),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            width: 30,
            height: 30,
            child: MiImages.logo,
          ),
          Expanded(
            child: Text(
              text,
              style: textTheme.bodyMedium!.copyWith(
                color: isError ? colorScheme.onErrorContainer : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    ),
  );
}
