import 'package:flutter/material.dart';
import 'package:paint_defect_pro_ui/screens/defect_clips_screen.dart';
import 'package:paint_defect_pro_ui/screens/home_screen.dart';
import 'package:paint_defect_pro_ui/screens/painter_network_screen.dart';
import 'package:paint_defect_pro_ui/screens/product_finder.dart';
import 'package:paint_defect_pro_ui/theme/app_colors.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const PaintDefectProApp());
}

class PaintDefectProApp extends StatelessWidget {
  const PaintDefectProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paint Defect Pro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/clips': (context) => const DefectClipsScreen(),
        '/cart': (context) => const CartScreen(),
        '/profile': (context) => const PainterNetworkScreen(),
        '/product-finder': (context) => const ProductFinderScreen(),
      },
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        title: const Text('Cart Page',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
                letterSpacing: 1)),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
