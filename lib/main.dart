import 'package:flutter/material.dart';
import 'package:music_app/router/app_routes.dart';
import 'package:music_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        title: 'Music App',
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute);
  }
}
