import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/home/presentation/widgets/home/discount_banner.dart';
import 'package:shopix_user/feature/home/presentation/widgets/home/food_list.dart';
import 'package:shopix_user/feature/home/presentation/widgets/home/home_haeder.dart';
import 'package:shopix_user/feature/home/presentation/widgets/home/restaurants_banner.dart';
import 'package:shopix_user/feature/home/presentation/widgets/home/restaurants_list.dart';
import 'package:shopix_user/feature/home/presentation/widgets/home/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const ScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                sliver: const SliverToBoxAdapter(child: HomeHader()),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                sliver: const SliverToBoxAdapter(child: CoustomSearchBar()),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                sliver: const SliverToBoxAdapter(child: DiscountBanner()),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                sliver: SliverToBoxAdapter(
                  child: FoodList(key: ValueKey(context.isarbic())),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                sliver: const SliverToBoxAdapter(child: RestaurantsBanner()),
              ),

              const RestaurantsList(),

              SliverToBoxAdapter(child: SizedBox(height: 80.h)),
            ],
          ),
        ),
      ),
    );
  }
}
