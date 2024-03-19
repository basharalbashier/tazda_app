import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';

showSnackbar(String text, BuildContext? context) {
  try {
    ScaffoldMessenger.of(
      navigatorKey.currentContext ?? context!,
    ).showSnackBar(SnackBar(
        content: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold),
    )));
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
}
