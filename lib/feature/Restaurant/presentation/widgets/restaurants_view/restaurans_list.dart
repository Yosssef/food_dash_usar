import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/retaurant_card.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/staggered_reveal.dart';

class ReataurantsList extends StatelessWidget {
  const ReataurantsList({
    super.key,
    required this.results,
    required this.onToggleFavorite,
  });

  final List<RestaurantResultModel> results;
  final void Function(RestaurantResultModel restaurant) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final restaurant = results[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: StaggeredReveal(
              key: ValueKey(restaurant.id),
              index: index,
              child: RestaurantResultCard(
                key: ValueKey(restaurant.id),
                restaurant: restaurant,
                onToggleFavorite: () => onToggleFavorite(restaurant),
                onTap: () => Navigator.pushNamed(context, kRestaurant),
              ),
            ),
          );
        }, childCount: results.length),
      ),
    );
  }
}
