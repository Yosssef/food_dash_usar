import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
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
        title = 'No favorites yet';
        subtitle = 'Tap the heart on any restaurant to save it here.';
        break;
      case ResultsMode.category:
        icon = Icons.ramen_dining_outlined;
        title = 'Nothing here yet';
        subtitle = 'No restaurants in this category right now.';
        break;
      case ResultsMode.search:
        icon = Icons.search_off_rounded;
        title = query.trim().isEmpty ? 'Search for something' : 'No results';
        subtitle = query.trim().isEmpty
            ? 'Try a restaurant name.'
            : 'Nothing matched "$query". Try a different name.';
        break;
      case ResultsMode.seeall:
        icon = Icons.search_off_rounded;
        title = 'No matches';
        subtitle = 'Try a different category or search term.';
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
