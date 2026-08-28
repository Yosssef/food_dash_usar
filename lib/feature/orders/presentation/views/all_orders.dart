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

class OrderModel {
  final String restaurantImageUrl;
  final String restaurantName;
  final String itemsSummary;
  final double total;
  final OrderStatus status;
  final double? rating;

  const OrderModel({
    required this.restaurantImageUrl,
    required this.restaurantName,
    required this.itemsSummary,
    required this.total,
    required this.status,
    this.rating,
  });
}

const String mcDonaldsLogo =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQktrqXRcOSfgUWoZNLE0WT1eXtCuvLtr7yWjvkAW9kWg&s=10';
const String bellaNapoliLogo =
    'https://play-lh.googleusercontent.com/SEhqEVSBIMp52GYPbhd7e2ZvX7TOK0INXl4pL6S82y6bhMx6CVdSrSB8eOeJ0zIzGfPcF7PRiLJS6kf1vk3_TQ';

final List<OrderModel> orders = const [
  OrderModel(
    restaurantImageUrl: mcDonaldsLogo,
    restaurantName: "McDonald's",
    itemsSummary: '2x Big Mac, 1x McChicken',
    total: 388,
    status: OrderStatus.delivered,
    rating: 4,
  ),
  OrderModel(
    restaurantImageUrl: bellaNapoliLogo,
    restaurantName: "Bella Napoli",
    itemsSummary: '2× Margherita, 1× Tiramisu',
    total: 459,
    status: OrderStatus.cancelled,
  ),
  OrderModel(
    restaurantImageUrl: mcDonaldsLogo,
    restaurantName: "McDonald's",
    itemsSummary: '1x Happy Meal, 1x Cheeseburger',
    total: 210,
    status: OrderStatus.preparing,
  ),
  OrderModel(
    restaurantImageUrl: bellaNapoliLogo,
    restaurantName: "Bella Napoli",
    itemsSummary: '1× Pepperoni Pizza, 2× Coca Cola',
    total: 340,
    status: OrderStatus.delivered,
    rating: 5,
  ),
];
