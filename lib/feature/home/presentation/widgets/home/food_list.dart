import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';

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
              label: categories[index].key,
              context: context,
              color: Colors.white,
              backgroundColor: categories[index].backgroundColor,
              ontap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantsResultsView(
                    mode: ResultsMode.category,
                    initialCatgoryKey: categories[index].key,
                    initialCategory: categories[index].title,
                  ),
                ),
              ),
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
  required VoidCallback ontap,
  required Color color,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
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
              child: FaIcon(icon, color: color, size: 20.sp),
            ),
          ),
          SizedBox(height: 6.h),

          Text(
            context.tr(label),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6E6E6E),
            ),
          ),
        ],
      ),
    ),
  );
}

class CategoryModel {
  final String title;
  final FaIconData icon;
  final Color backgroundColor;
  final String key;

  CategoryModel({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.key,
  });
}

List<CategoryModel> get categories => [
  CategoryModel(
    key: 'home.category_burgers',
    icon: FontAwesomeIcons.burger,
    backgroundColor: const Color(0xFFD66344),
    title: 'Burgers',
  ),
  CategoryModel(
    key: 'home.category_pizza',
    icon: FontAwesomeIcons.pizzaSlice,
    backgroundColor: const Color(0xFFBD3B22),
    title: 'Pizza',
  ),
  CategoryModel(
    key: 'home.category_desserts',
    icon: FontAwesomeIcons.iceCream,
    backgroundColor: const Color(0xFFC47B95),
    title: 'Desserts',
  ),
  CategoryModel(
    key: 'home.category_drinks',
    icon: FontAwesomeIcons.glassWater,
    backgroundColor: const Color(0xFF8C6247),
    title: 'Drinks',
  ),
  CategoryModel(
    key: 'home.category_bakery',
    icon: FontAwesomeIcons.breadSlice,
    backgroundColor: const Color(0xFFC98A5B),
    title: 'Bakery',
  ),
  CategoryModel(
    key: 'home.category_seafood',
    icon: FontAwesomeIcons.fish,
    backgroundColor: const Color(0xFF5A8192),
    title: 'Seafood',
  ),
];
