import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';

class RestaurantsBanner extends StatelessWidget {
  const RestaurantsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Restaurants near you",
          style: TextStyle(
            fontSize: 20.sp,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w900,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantsResultsView(mode: ResultsMode.seeall),
            ),
          ),
          child: Text(
            "see all",
            style: TextStyle(
              fontSize: 16.sp,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
