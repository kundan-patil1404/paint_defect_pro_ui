import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
/// Shared bottom navigation bar used across Home / Painter network etc.
/// Pass [currentIndex] and handle [onTap] to navigate between root screens.
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = <_NavItem>[
      _NavItem(Bi.house, Bi.house_fill, 'Home'),
      _NavItem(Bi.camera_video, Bi.camera_video_fill , 'Clips'),
      _NavItem(Bi.cart2, Bi.cart_plus_fill, 'Cart'),
      _NavItem(AntDesign.user_outlined, AntDesign.user_outlined, 'Profile'),
    ];

    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: AppColors.darkBackground,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (index) {
            final selected = index == currentIndex;
            final item = items[index];
            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Iconify(
                  selected ? item.filled : item.outline,
                  color: selected ? AppColors.primaryOrange : AppColors.white,
                  size: 30,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final String outline;
  final String filled;
  final String label;
  _NavItem(this.outline, this.filled, this.label);
}
