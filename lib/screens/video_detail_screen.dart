import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/responsive.dart';

class VideoDetailScreen extends StatelessWidget {
  final String issue;

  const VideoDetailScreen({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    final steps = [
      'Scrape and sand loose paint back to sound stucco',
      'Apply bonding painter to seal chalky surface',
      'Recoat with flexible acrylic exterior finish',
    ];

    return Scaffold(
      backgroundColor: AppColors.creamBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        title: Text(
          'Fix it $issue',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Responsive.sp(context, 17),
          ),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.w(context, 25),
          vertical: Responsive.h(context, 16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoPlayer(context),

            SizedBox(
              height: Responsive.h(context, 30),
            ),

            Text(
              'Repair steps',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Responsive.sp(context, 16),
                color: AppColors.textDark,
              ),
            ),

            SizedBox(
              height: Responsive.h(context, 15),
            ),

            ...List.generate(
              steps.length,
                  (i) => _StepTile(
                number: i + 1,
                text: steps[i],
              ),
            ),

            SizedBox(
              height: Responsive.h(context, 24),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.w(context, 16),
              ),
              child: SizedBox(
                width: double.infinity,
                height: Responsive.h(context, 45),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Responsive.r(context, 8),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'See recomended products',
                    style: TextStyle(
                      fontSize: Responsive.sp(context, 14),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: Responsive.h(context, 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 11,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              Responsive.r(context, 16),
            ),
            child: Image.asset(
              'assets/images/homescreen/solution_image.png',
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            top: Responsive.h(context, 10),
            left: Responsive.w(context, 10),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.w(context, 10),
                vertical: Responsive.h(context, 4),
              ),
              decoration: BoxDecoration(
                color: const Color(0xffDFB21E),
                borderRadius: BorderRadius.circular(
                  Responsive.r(context, 12),
                ),
              ),
              child: Text(
                'Solution clip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Responsive.sp(context, 12),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Center(
            child: CircleAvatar(
              radius: Responsive.r(context, 26),
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.play_arrow_outlined,
                color: AppColors.white,
                size: Responsive.icon(context, 50),
              ),
            ),
          ),

          Positioned(
            bottom: Responsive.h(context, 10),
            right: Responsive.w(context, 10),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.w(context, 6),
                vertical: Responsive.h(context, 2),
              ),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(
                  Responsive.r(context, 4),
                ),
              ),
              child: Text(
                '0:30',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Responsive.sp(context, 11),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  final int number;
  final String text;

  const _StepTile({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.h(context, 12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: Responsive.r(context, 17),
            backgroundColor: const Color(0xffDEECE4),
            child: Text(
              '$number',
              style: TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: Responsive.sp(context, 16),
              ),
            ),
          ),

          SizedBox(
            width: Responsive.w(context, 12),
          ),

          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: Responsive.sp(context, 14),
                color: AppColors.textDark,
                height: 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}