import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import 'video_detail_screen.dart';

class DefectClipsScreen extends StatelessWidget {
  const DefectClipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clips = [
      _ClipData(
        'assets/images/homescreen/peeling.png',
        'Peeling On Stucco Exterior',
        '0:14',
        'peeling stucco',
      ),
      _ClipData(
        'assets/images/homescreen/blistering.png',
        'Blistering on Interior Drywall',
        '0:14',
        'blistering interior',
      ),
      _ClipData(
        'assets/images/homescreen/cracking.png',
        'Cracking On Exterior Wall',
        '0:14',
        'cracking exterior',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.creamBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        title: Text(
          'Paint Defect Clips',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Responsive.sp(context, 17),
            letterSpacing: Responsive.sp(context, 1),
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
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(
                Responsive.w(context, 16),
              ),
              itemCount: clips.length,
              separatorBuilder: (_, __) {
                return SizedBox(
                  height: Responsive.h(context, 16),
                );
              },
              itemBuilder: (context, index) {
                final clip = clips[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideoDetailScreen(
                          issue: clip.issue,
                        ),
                      ),
                    );
                  },
                  child: _ClipCard(
                    clip: clip,
                  ),
                );
              },
            ),
          ),

          Container(
            height: Responsive.h(context, 65),
            padding: EdgeInsets.fromLTRB(
              Responsive.w(context, 16),
              0,
              Responsive.w(context, 16),
              Responsive.h(context, 20),
            ),
            child: SizedBox(
              width: double.infinity,
              height: Responsive.h(context, 45),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.file_upload_outlined,
                  size: Responsive.icon(context, 20),
                ),
                label: Text(
                  'Upload new clip',
                  style: TextStyle(
                    fontSize: Responsive.sp(context, 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClipData {
  final String image;
  final String caption;
  final String duration;
  final String issue;

  _ClipData(
      this.image,
      this.caption,
      this.duration,
      this.issue,
      );
}

class _ClipCard extends StatelessWidget {
  final _ClipData clip;

  const _ClipCard({
    required this.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBeige,
        borderRadius: BorderRadius.circular(
          Responsive.r(context, 12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 17.5 / 7,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Responsive.r(context, 14),
                  ),
                  child: Image.asset(
                    clip.image,
                    fit: BoxFit.contain,
                  ),
                ),

                Center(
                  child: CircleAvatar(
                    radius: Responsive.r(context, 30),
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.play_arrow_outlined,
                      color: AppColors.textDark,
                      size: Responsive.icon(context, 50),
                    ),
                  ),
                ),

                Positioned(
                  bottom: Responsive.h(context, 8),
                  right: Responsive.w(context, 8),
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
                      clip.duration,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.sp(context, 11),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Responsive.h(context, 16),
              horizontal: Responsive.w(context, 6),
            ),
            child: Text(
              clip.caption,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Responsive.sp(context, 13),
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}