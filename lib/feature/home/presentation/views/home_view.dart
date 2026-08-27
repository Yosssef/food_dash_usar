import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/home/presentation/widgets/discount_banner.dart';
import 'package:shopix_user/feature/home/presentation/widgets/food_list.dart';
import 'package:shopix_user/feature/home/presentation/widgets/home_haeder.dart';
import 'package:shopix_user/feature/home/presentation/widgets/restaurants_banner.dart';
import 'package:shopix_user/feature/home/presentation/widgets/restaurants_list.dart';
import 'package:shopix_user/feature/home/presentation/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const ScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16.w),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHader(),

                    CoustomSearchBar(),

                    DiscountBanner(),

                    SizedBox(height: 16.h),

                    FoodList(),

                    SizedBox(height: 12.h),

                    RestaurantsBanner(),
                  ],
                ),
              ),
            ),

            RestaurantsList(),
            SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 70.h)),
          ],
        ),
      ),
    );
  }
}
