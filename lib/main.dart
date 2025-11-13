import 'package:flutter/material.dart';
import 'core/app_colors.dart';
import 'pages/dashboard_pages.dart';

void main() {
  runApp(const KuisApp());
}

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.babyPowder,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}