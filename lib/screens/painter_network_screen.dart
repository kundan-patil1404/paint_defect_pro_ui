import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/app_bottom_nav.dart';

class PainterNetworkScreen extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onNavTap;

  const PainterNetworkScreen({
    super.key,
    this.currentIndex = 3,
    this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    final features = [
      _FeatureData(
        Icons.shield,
        'Verified Professionals',
        'assets/vector/homescreen/shield.svg',
      ),
      _FeatureData(
        Icons.star_border,
        'Real reviews',
      ),
      _FeatureData(
        Icons.location_on_outlined,
        'Local to your area',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        title: Text(
          'Painter network',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Responsive.sp(context, 17),
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: Responsive.icon(context, 24),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.w(context, 25),
          vertical: Responsive.h(context, 16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeroCard(context),

            SizedBox(
              height: Responsive.h(context, 20),
            ),

            ...List.generate(
              features.length,
                  (i) {
                final feature = features[i];

                return _FeatureTile(
                  data: feature,
                  isFirst: i == 0,
                  isLast: i == features.length - 1,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          if (onNavTap != null) {
            onNavTap!(index);
            return;
          }

          _navigateFromBottomNav(context, index);
        },
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.h(context, 28),
        horizontal: Responsive.w(context, 20),
      ),
      decoration: BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.circular(
          Responsive.r(context, 16),
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/vector/homescreen/group_3.svg',
            width: Responsive.w(context, 80),
            height: Responsive.h(context, 80),
            fit: BoxFit.contain,
          ),

          SizedBox(
            height: Responsive.h(context, 14),
          ),

          Text(
            'Find trusted\npainting professionals',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: Responsive.sp(context, 19),
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),

          SizedBox(
            height: Responsive.h(context, 10),
          ),

          Text(
            'Connect with certified painters\nin your area.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: Responsive.sp(context, 13),
              height: 1.4,
            ),
          ),

          SizedBox(
            height: Responsive.h(context, 20),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Responsive.r(context, 25),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Responsive.h(context, 8),
                horizontal: Responsive.w(context, 14),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Search painters',
                    style: TextStyle(
                      fontSize: Responsive.sp(context, 14),
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  SizedBox(
                    width: Responsive.w(context, 6),
                  ),

                  Icon(
                    Icons.arrow_forward,
                    size: Responsive.icon(context, 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateFromBottomNav(
      BuildContext context,
      int index,
      ) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(
          context,
          '/home',
        );
        break;

      case 1:
        Navigator.pushReplacementNamed(
          context,
          '/clips',
        );
        break;

      case 2:
        Navigator.pushReplacementNamed(
          context,
          '/cart',
        );
        break;

      case 3:
        break;
    }
  }
}

class _FeatureData {
  final IconData icon;
  final String? iconsData;
  final String label;

  const _FeatureData(
      this.icon,
      this.label, [
        this.iconsData,
      ]);
}

class _FeatureTile extends StatelessWidget {
  final _FeatureData data;
  final bool isFirst;
  final bool isLast;

  const _FeatureTile({
    required this.data,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F1),
        borderRadius: BorderRadius.vertical(
          top: isFirst
              ? Radius.circular(
            Responsive.r(context, 12),
          )
              : Radius.zero,
          bottom: isLast
              ? Radius.circular(
            Responsive.r(context, 12),
          )
              : Radius.zero,
        ),
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(
            color: Colors.black,
            width: Responsive.w(context, 0.5),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.w(context, 16),
        vertical: Responsive.h(context, 14),
      ),
      child: Row(
        children: [
          data.iconsData == null
              ? Icon(
            data.icon,
            size: Responsive.icon(context, 27),
            color: AppColors.textDark,
          )
              : SvgPicture.asset(
            data.iconsData!,
            width: Responsive.w(context, 24),
            height: Responsive.h(context, 27),
          ),

          SizedBox(
            width: Responsive.w(context, 14),
          ),

          Expanded(
            child: Text(
              data.label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Responsive.sp(context, 14),
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}