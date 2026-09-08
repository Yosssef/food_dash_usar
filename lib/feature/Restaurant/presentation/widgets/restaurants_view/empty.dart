import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';

class Empty extends StatelessWidget {
  final ResultsMode mode;
  final String query;
  const Empty({super.key, required this.mode, required this.query});

  @override
  Widget build(BuildContext context) {
    late final IconData icon;
    late final String title;
    late final String subtitle;

    switch (mode) {
      case ResultsMode.favorites:
        icon = Icons.favorite_border_rounded;
        title = context.tr("restaurant_results.empty_favorites_title");
        subtitle = context.tr("restaurant_results.empty_favorites_subtitle");
        break;
      case ResultsMode.category:
        icon = Icons.ramen_dining_outlined;
        title = context.tr("restaurant_results.empty_category_title");
        subtitle = context.tr("restaurant_results.empty_category_subtitle");
        break;
      case ResultsMode.search:
        icon = Icons.search_off_rounded;
        title = query.trim().isEmpty
            ? context.tr("restaurant_results.empty_search_prompt")
            : context.tr("restaurant_results.empty_search_no_results");
        subtitle = query.trim().isEmpty
            ? context.tr('restaurant_results.empty_search_hint')
            : "${context.tr("restaurant_results.empty_search_no_match")} $query ${context.tr("restaurant_results.empty_search_no_match2")}";
        break;
      case ResultsMode.seeall:
        icon = Icons.search_off_rounded;
        title = context.tr("restaurant_results.empty_generic_title");
        subtitle = context.tr("restaurant_results.empty_generic_subtitle");
        break;
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56.r, color: Colors.grey.shade300),
            SizedBox(height: 14.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
