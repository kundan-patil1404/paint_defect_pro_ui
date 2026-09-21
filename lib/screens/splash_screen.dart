import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../utils/responsive.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111616),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/splashscreen/background.png',
                  fit: BoxFit.cover,
                  color: const Color(0xFF151918),
                  colorBlendMode: BlendMode.overlay,
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: Responsive.h(context, 670),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: Responsive.h(context, 52),
                child: const ColoredBox(
                  color: Color(0xFFD9D9D9),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  'assets/vector/splashscreen/splash_bottom.svg',
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fitWidth,
                ),
              ),

              Positioned(
                top: Responsive.h(context, 100),
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/splashscreen/dunn_edwards_logo.png',
                  height: Responsive.h(context, 50),
                  width: Responsive.w(context, 175),
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: Responsive.h(context, 139),
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'PAINTS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Responsive.sp(context, 16),
                      fontWeight: FontWeight.w700,
                      letterSpacing: Responsive.sp(context, 0.4),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: Responsive.h(context, 182),
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      width: Responsive.w(context, 98),
                      height: Responsive.h(context, 98),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange,
                        borderRadius: BorderRadius.circular(
                          Responsive.r(context, 16),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/vector/splashscreen/app_logo.svg',
                          width: Responsive.w(context, 98),
                          height: Responsive.h(context, 98),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Responsive.h(context, 7),
                    ),

                    Text(
                      'PAINT DEFECT PRO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.sp(context, 16),
                        fontWeight: FontWeight.w600,
                        letterSpacing: Responsive.sp(context, 0.4),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: Responsive.h(context, 420),
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'PAINTS THAT INSPIRE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.sp(context, 16),
                        fontWeight: FontWeight.w400,
                        letterSpacing: Responsive.sp(context, 2.1),
                      ),
                    ),

                    SizedBox(
                      height: Responsive.h(context, 25),
                    ),

                    Container(
                      width: Responsive.w(context, 122),
                      height: Responsive.h(context, 1),
                      color: AppColors.primaryOrange,
                    ),

                    SizedBox(
                      height: Responsive.h(context, 18),
                    ),

                    Text(
                      'Trusted Paint Solutions\nfor the trade',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.sp(context, 15),
                        height: 1.35,
                        letterSpacing: Responsive.sp(context, 0.35),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                right: Responsive.w(context, 17),
                bottom: Responsive.h(context, 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/home',
                    );
                  },
                  child: SizedBox(
                    width: Responsive.w(context, 32),
                    height: Responsive.h(context, 32),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: Responsive.icon(context, 20),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}