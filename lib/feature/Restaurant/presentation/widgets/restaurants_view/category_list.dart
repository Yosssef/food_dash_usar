import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/category_chip.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.allCategories,
    required this.selectedCategory,
    required this.all,
    required this.ontap,
  });

  final List<String> allCategories;
  final String? selectedCategory;
  final String all;
  final ValueChanged<String> ontap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 44.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: allCategories.length,
          separatorBuilder: (_, _) => SizedBox(width: 8.w),
          itemBuilder: (context, index) {
            final cat = allCategories[index];
            final selected = cat == (selectedCategory ?? all);
            return CategoryChip(
              label: cat,
              selected: selected,
              onTap: () => ontap(cat),
            );
          },
        ),
      ),
    );
  }
}
