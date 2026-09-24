import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../widgets/app_bottom_nav.dart';
import '../utils/responsive.dart';
import 'defect_clips_screen.dart';
import 'video_detail_screen.dart';
import 'painter_network_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildTopBar(context),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroBanner(context),

                    Padding(
                      padding: EdgeInsets.all(
                        Responsive.w(context, 16),
                      ),
                      child: Column(
                        children: [
                          _buildMenuGrid(context),

                          SizedBox(
                            height: Responsive.h(context, 14),
                          ),

                          _buildWeeklySpecial(context),

                          SizedBox(
                            height: Responsive.h(context, 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _navIndex,
        onTap: (i) {
          setState(() {
            _navIndex = i;
          });

          if (i == 1) {
            Navigator.pushNamed(context, '/clips');
          } else if (i == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      height: Responsive.h(context, 90),
      color: AppColors.darkBackground,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.w(context, 16),
        vertical: Responsive.h(context, 14),
      ),
      child: Row(
        children: [
          Container(
            width: Responsive.w(context, 48),
            height: Responsive.h(context, 47.19),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.circular(
                Responsive.r(context, 16),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/vector/splashscreen/app_logo.svg',
                width: Responsive.w(context, 48),
                height: Responsive.h(context, 48),
                fit: BoxFit.contain,
              ),
            ),
          ),

          const Spacer(),

          SvgPicture.asset(
            'assets/icons/bell_icon.svg',
            width: Responsive.icon(context, 24),
            height: Responsive.icon(context, 24),
          ),

          SizedBox(
            width: Responsive.w(context, 18),
          ),

          SvgPicture.asset(
            'assets/icons/person.svg',
            width: Responsive.icon(context, 24),
            height: Responsive.icon(context, 24),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    return Container(
      height: Responsive.h(context, 190),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3A2E22),
            Color(0xFF6B4A2A),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/homescreen/home_image.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: Responsive.h(context, 34),
            child: const ColoredBox(
              color: Colors.white54,
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/vector/splashscreen/splash_bottom.svg',
              width: Responsive.w(context, 152),
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    final items = [
      _MenuItemData(
        'assets/icons/video-outline.svg',
        'Defect clips',
        'Common issue',
            () {
          Navigator.pushNamed(context, '/clips');
        },
      ),
      _MenuItemData(
        'assets/icons/tools.svg',
        'Fix it clips',
        'Step-by-step',
            () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const VideoDetailScreen(
                issue: 'peeling stucco',
              ),
            ),
          );
        },
      ),
      _MenuItemData(
        'assets/icons/carbon_chat.svg',
        'Product finder',
        'recommended fix',
            ()  {
              Navigator.pushNamed(
                context,
                '/product-finder',
              );
            },
      ),
      _MenuItemData(
        'assets/icons/bi_people.svg',
        'Painter network',
        'Trusted',
            () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      _MenuItemData(
        'assets/icons/science-outlined.svg',
        'Ask an expert',
        'Submit a question',
            () {},
      ),
      _MenuItemData(
        'assets/icons/location_icon.svg',
        'Find a store',
        '8 in your territory',
            () {},
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: Responsive.h(context, 10),
        crossAxisSpacing: Responsive.w(context, 10),
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        return _MenuCard(
          item: items[index],
        );
      },
    );
  }

  Widget _buildWeeklySpecial(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.w(context, 16),
        vertical: Responsive.h(context, 14),
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(
          Responsive.r(context, 12),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/book.svg',
            width: Responsive.icon(context, 24),
            height: Responsive.icon(context, 24),
          ),

          SizedBox(
            width: Responsive.w(context, 12),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weekly special',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.sp(context, 16),
                  ),
                ),

                Text(
                  '15% off Suprema',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: Responsive.sp(context, 12),
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: Responsive.icon(context, 22),
          ),
        ],
      ),
    );
  }
}

class _MenuItemData {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  _MenuItemData(
      this.icon,
      this.title,
      this.subtitle,
      this.onTap,
      );
}

class _MenuCard extends StatelessWidget {
  final _MenuItemData item;

  const _MenuCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        Responsive.r(context, 12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(
          Responsive.r(context, 12),
        ),
        onTap: item.onTap,
        child: Padding(
          padding: EdgeInsets.all(
            Responsive.w(context, 12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    item.icon,
                    width: Responsive.icon(context, 30),
                    height: Responsive.icon(context, 30),
                  ),

                  const Spacer(),

                  Icon(
                    Icons.chevron_right,
                    size: Responsive.icon(context, 28),
                    color: AppColors.textGrey,
                  ),
                ],
              ),

              const Spacer(),

              Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.sp(context, 14),
                  color: AppColors.textDark,
                ),
              ),

              SizedBox(
                height: Responsive.h(context, 2),
              ),

              Text(
                item.subtitle,
                style: TextStyle(
                  fontSize: Responsive.sp(context, 13),
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}