import 'package:flutter/material.dart';

class MenuOption {
  final String route;
  final String routeName;
  final Widget screen;
  final Map<String, dynamic>? args;

  MenuOption({
    required this.route,
    required this.routeName,
    required this.screen,
    this.args,
  });
}
