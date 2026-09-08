import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.onSearchChanged,
    required this.searchController,
    required this.mode,
    this.initialQuery,
  });
  final ResultsMode mode;
  final String? initialQuery;
  final ValueChanged<String> onSearchChanged;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 4.h),
        child: TextField(
          controller: searchController,
          autofocus: initialQuery == null && mode == ResultsMode.search,
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: scheme.surfaceContainer,
            hintText: context.tr("restaurant_results.empty_search_hint"),
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15.sp),
            prefixIcon: Icon(Icons.search, color: scheme.secondary),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
