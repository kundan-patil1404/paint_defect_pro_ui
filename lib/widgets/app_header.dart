import 'package:flutter/material.dart';
import 'package:paint_defect_pro_ui/theme/app_colors.dart';
import '../theme/app_theme.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;

  const AppHeader({super.key, required this.title, this.back = false});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: back
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      actions: back
          ? null
          : const [
              Icon(Icons.notifications_none_rounded, size: 23),
              SizedBox(width: 16),
              Icon(Icons.person_outline_rounded, size: 23),
              SizedBox(width: 18),
            ],
    );
  }
}

class BrandMark extends StatelessWidget {
  final bool small;

  const BrandMark({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    final size = small ? 42.0 : 48.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.format_paint_rounded, color: AppColors.darkBackgroundLight, size: size * .55),
    );
  }
}
