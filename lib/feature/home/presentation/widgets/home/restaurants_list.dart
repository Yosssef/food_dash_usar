import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/retaurant_card.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: EdgeInsets.all(2.r),
            child: RestaurantResultCard(
              restaurant: demoRestaurants[index],
              onToggleFavorite: () {},
              onTap: () => Navigator.pushNamed(context, kRestaurant),
            ),
          );
        }, childCount: demoRestaurants.length),
      ),
    );
  }
}
