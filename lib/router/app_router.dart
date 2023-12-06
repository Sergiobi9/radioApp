import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static void routeToPage(
      {required BuildContext context,
      String path = "/",
      Object? extra,
      Function()? onBackPressed}) {
    context.pushReplacement(path, extra: extra);
  }

  static Future<Object?> routeToPageWithBack(
      {required BuildContext context,
      String path = "/",
      Object? extra,
      Function()? onBackPressed}) {
    return context.push(path, extra: extra);
  }

  static removeAllRoutesInStack({required BuildContext context}) {
    bool canPop = context.canPop();
    while (canPop) {
      context.pop();
      canPop = context.canPop();
    }
  }
}
