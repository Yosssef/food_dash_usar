import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/all_orders/order_card.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/all_orders/status_pill.dart';

class OredersView extends StatelessWidget {
  const OredersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 8.r),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Your Orders",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 27.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final order = orders[index];
              return OrderHistoryCard(
                order: order,
                onReorder: () {},
                onRate: () {},
                ontap: () => Navigator.pushNamed(context, kOrderinfo),
              );
            }, childCount: orders.length),
          ),
          SliverPadding(padding: EdgeInsetsGeometry.only(bottom: 80.h)),
        ],
      ),
    );
  }
}
