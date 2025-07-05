import 'package:flutter/material.dart';
import '../../constant.dart';

class CsnackBar {
  static ScaffoldMessengerState show(
    BuildContext? context, {
    SnackBarBehavior? behavior = SnackBarBehavior.floating,
    SnackBarAction? action,
    required String? content,
    Color? color,
  }) {
    return ScaffoldMessenger.of(context!)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          width: behavior != SnackBarBehavior.floating
              ? null
              : MediaQuery.of(context).size.width * 0.80,
          backgroundColor: color,
          behavior: behavior,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defBorderRadius),
          ),
          content: Text(
            content!,
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
          action: action,
        ),
      );
  }
}
