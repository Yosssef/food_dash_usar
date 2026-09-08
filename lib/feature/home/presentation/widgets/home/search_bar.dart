import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';

class CoustomSearchBar extends StatelessWidget {
  const CoustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (value.trim().isEmpty) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantsResultsView(
                mode: ResultsMode.search,
                initialQuery: value.trim(),
              ),
            ),
          );
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainer,
          hintText: context.tr("home.search_hint"),
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16.sp),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.secondary,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
