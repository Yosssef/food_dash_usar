import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: buildCategoryItem(
              icon: categories[index].icon,
              label: categories[index].title,
              backgroundColor: categories[index].backgroundColor,
            ),
          );
        },
      ),
    );
  }
}

Widget buildCategoryItem({
  required FaIconData icon,
  required String label,
  required Color backgroundColor,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.r),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 70.w,
          height: 38.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: FaIcon(icon, color: Colors.white, size: 20.sp),
          ),
        ),
        SizedBox(height: 6.h),

        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF6E6E6E),
          ),
        ),
      ],
    ),
  );
}

class CategoryModel {
  final String title;
  final FaIconData icon;
  final Color backgroundColor;

  CategoryModel({
    required this.title,
    required this.icon,
    required this.backgroundColor,
  });
}

final List<CategoryModel> categories = [
  CategoryModel(
    title: 'Burgers',
    icon: FontAwesomeIcons.burger,
    backgroundColor: const Color(0xFFD66344),
  ),
  CategoryModel(
    title: 'Pizza',
    icon: FontAwesomeIcons.pizzaSlice,
    backgroundColor: const Color(0xFFBD3B22),
  ),
  CategoryModel(
    title: 'Desserts',
    icon: FontAwesomeIcons.iceCream,
    backgroundColor: const Color(0xFFC47B95),
  ),
  CategoryModel(
    title: 'Drinks',
    icon: FontAwesomeIcons.glassWater,
    backgroundColor: const Color(0xFF8C6247),
  ),
  CategoryModel(
    title: 'Bakery',
    icon: FontAwesomeIcons.breadSlice,
    backgroundColor: const Color(0xFFC98A5B),
  ),
  CategoryModel(
    title: 'Seafood',
    icon: FontAwesomeIcons.fish,
    backgroundColor: const Color(0xFF5A8192),
  ),
];
