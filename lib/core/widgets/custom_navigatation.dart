import 'package:flutter/material.dart';

class CustomNavigation {
  static void navigateTo(context, widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

  static void navigateByNamedTo(context, widget) =>
      Navigator.pushNamed(context, widget);

  static void navigateAndFinish(context, widget) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false,
      );

  static void navigateAndFinishNyNamed(context, widget) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        widget,
        (Route<dynamic> route) => false,
      );

  static void navigateAndReplacement(context, widget) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => widget));
}
