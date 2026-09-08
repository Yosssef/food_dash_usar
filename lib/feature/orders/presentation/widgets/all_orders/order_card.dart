import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/all_orders/outline_button.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/all_orders/stars_diplay.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/all_orders/status_pill.dart';

class OrderHistoryCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback onReorder;
  final VoidCallback onRate;
  final VoidCallback ontap;
  const OrderHistoryCard({
    super.key,
    required this.order,
    required this.onReorder,
    required this.onRate,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: scheme.surfaceContainer,

            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: 0.07),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Container(
                        width: 72.w,
                        height: 72.h,
                        color: scheme.surface,
                        child: Image.network(
                          order.restaurantImageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.fastfood,
                            size: 30.r,
                            color: scheme.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  order.restaurantName,
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w800,
                                    color: scheme.onSurface,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              StatusPill(status: order.status),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${order.itemsSummary} ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey.shade500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${context.tr("restaurant.EGP")} ${order.total.toInt()} ',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey.shade500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 14.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ?order.status != OrderStatus.preparing
                        ? OutlineButton(
                            label: context.tr("orders.reorder"),
                            onTap: onReorder,
                          )
                        : null,
                    ?order.status != OrderStatus.delivered
                        ? null
                        : Row(
                            children: [
                              OutlineButton(
                                label: context.tr("orders.rate"),
                                onTap: onRate,
                              ),
                              SizedBox(width: 10.w),
                              StarsDisplay(rating: order.rating ?? 0),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
// Restaurant Logos Network URLs
const String kfcLogo = 'https://pngimg.com/uploads/kfc/kfc_PNG13.png';
const String burgerKingLogo =
    'https://c8.alamy.com/comp/2WBKNKP/burger-king-logos-popular-chains-of-fast-food-restaurants-vector-2WBKNKP.jpg';
const String starbucksLogo =
    'https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png';
const String pizzaHutLogo =
    'https://upload.wikimedia.org/wikipedia/sco/thumb/d/d2/Pizza_Hut_logo.svg/1200px-Pizza_Hut_logo.svg.png';
const String subwayLogo =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Subway_2016_logo.svg/1200px-Subway_2016_logo.svg.png';
const String cinnabonLogo =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Cinnabon_Logo.svg/1200px-Cinnabon_Logo.svg.png';
const String papaJohnsLogo =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Papa_John%27s_Logo_2019.svg/1200px-Papa_John%27s_Logo_2019.svg.png';
const String buffaloBurgerLogo =
    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&auto=format&fit=crop&q=60';
const String hardeesLogo =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Hardee%27s_logo.svg/1200px-Hardee%27s_logo.svg.png';
const String dunkinLogo =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Dunkin%27_Primary_Logo.svg/1200px-Dunkin%27_Primary_Logo.svg.png';
const String elDahanLogo =
    'https://images.unsplash.com/photo-1544025162-d76694265947?w=500&auto=format&fit=crop&q=60';
const String zaatarWZeitLogo =
    'https://images.unsplash.com/photo-1509722747041-616f39b57569?w=500&auto=format&fit=crop&q=60';
const String bazookaLogo =
    'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500&auto=format&fit=crop&q=60';
const String texasChickenLogo =
    'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?w=500&auto=format&fit=crop&q=60';
const String manoushehLogo =
    'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&auto=format&fit=crop&q=60';
const String costaCoffeeLogo =
    'https://upload.wikimedia.org/wikipedia/en/thumb/0/07/Costa_Coffee_logo.svg/1200px-Costa_Coffee_logo.svg.png';
final List<OrderModel> orders = const [
  OrderModel(
    restaurantImageUrl: mcDonaldsLogo,
    restaurantName: "McDonald's",
    itemsSummary: '2x Big Mac, 1x McChicken',
    total: 388,
    status: OrderStatus.preparing,
    rating: 4,
  ),
  OrderModel(
    restaurantImageUrl: bellaNapoliLogo,
    restaurantName: "Bella Napoli",
    itemsSummary: '2× Margherita, 1× Tiramisu',
    total: 459,
    status: OrderStatus.delivered,
  ),
  OrderModel(
    restaurantImageUrl: mcDonaldsLogo,
    restaurantName: "McDonald's",
    itemsSummary: '1x Happy Meal, 1x Cheeseburger',
    total: 210,
    status: OrderStatus.cancelled,
  ),
  OrderModel(
    restaurantImageUrl: bellaNapoliLogo,
    restaurantName: "Bella Napoli",
    itemsSummary: '1× Pepperoni Pizza, 2× Coca Cola',
    total: 340,
    status: OrderStatus.delivered,
    rating: 5,
  ),
  OrderModel(
    restaurantImageUrl: kfcLogo,
    restaurantName: "KFC",
    itemsSummary: '1x Mighty Zinger Box, 1x Fries',
    total: 275,
    status: OrderStatus.delivered,
    rating: 3,
  ),
  OrderModel(
    restaurantImageUrl: burgerKingLogo,
    restaurantName: "Burger King",
    itemsSummary: '2x Whopper Meal, 1x Onion Rings',
    total: 510,
    status: OrderStatus.cancelled,
  ),
  OrderModel(
    restaurantImageUrl: starbucksLogo,
    restaurantName: "Starbucks",
    itemsSummary: '1x Iced Caramel Macchiato, 1x Chocolate Croissant',
    total: 195,
    status: OrderStatus.delivered,
    rating: 5,
  ),
  OrderModel(
    restaurantImageUrl: pizzaHutLogo,
    restaurantName: "Pizza Hut",
    itemsSummary: '1x Super Supreme Large, 1x Garlic Bread',
    total: 420,
    status: OrderStatus.cancelled,
  ),
  OrderModel(
    restaurantImageUrl: subwayLogo,
    restaurantName: "Subway",
    itemsSummary: '1x Chicken Teriyaki Footlong, 1x Cookie',
    total: 230,
    status: OrderStatus.delivered,
    rating: 4,
  ),
  OrderModel(
    restaurantImageUrl: cinnabonLogo,
    restaurantName: "Cinnabon",
    itemsSummary: '2x Classic Roll, 1x Pecanbon',
    total: 320,
    status: OrderStatus.delivered,
    rating: 5,
  ),
  OrderModel(
    restaurantImageUrl: papaJohnsLogo,
    restaurantName: "Papa John's",
    itemsSummary: '1x Chicken BBQ Pizza, 1x Cheesesticks',
    total: 390,
    status: OrderStatus.delivered,
    rating: 4,
  ),
  OrderModel(
    restaurantImageUrl: buffaloBurgerLogo,
    restaurantName: "Buffalo Burger",
    itemsSummary: '1x Shiitake Mushroom Burger, 1x Curly Fries',
    total: 295,
    status: OrderStatus.cancelled,
  ),
  OrderModel(
    restaurantImageUrl: hardeesLogo,
    restaurantName: "Hardee's",
    itemsSummary: '2x Famous Star Combo, 1x Mushroom & Swiss',
    total: 480,
    status: OrderStatus.delivered,
    rating: 2,
  ),
  OrderModel(
    restaurantImageUrl: dunkinLogo,
    restaurantName: "Dunkin'",
    itemsSummary: '6x Assorted Donuts, 1x Iced Coffee',
    total: 240,
    status: OrderStatus.delivered,
    rating: 5,
  ),
  OrderModel(
    restaurantImageUrl: elDahanLogo,
    restaurantName: "El Dahan",
    itemsSummary: '1/2 kg Mix Grill, 1x Mombar, 1x Tahini',
    total: 680,
    status: OrderStatus.delivered,
    rating: 5,
  ),
  OrderModel(
    restaurantImageUrl: zaatarWZeitLogo,
    restaurantName: "Zaatar w Zeit",
    itemsSummary: '1x Famous Frank, 1x Halloumi Pan, 1x Orange Juice',
    total: 310,
    status: OrderStatus.cancelled,
  ),
  OrderModel(
    restaurantImageUrl: bazookaLogo,
    restaurantName: "Bazooka",
    itemsSummary: '1x Bazooka Chicken Box 4pcs, 1x Fries',
    total: 260,
    status: OrderStatus.delivered,
  ),
  OrderModel(
    restaurantImageUrl: texasChickenLogo,
    restaurantName: "Texas Chicken",
    itemsSummary: '2x Mexicana Wrap, 1x Honey Butter Biscuit',
    total: 285,
    status: OrderStatus.delivered,
    rating: 4,
  ),
  OrderModel(
    restaurantImageUrl: manoushehLogo,
    restaurantName: "Manousheh",
    itemsSummary: '2x Zaatar Wrap, 1x Cheese & Akkawi',
    total: 180,
    status: OrderStatus.delivered,
    rating: 4,
  ),
  OrderModel(
    restaurantImageUrl: costaCoffeeLogo,
    restaurantName: "Costa Coffee",
    itemsSummary: '1x Spanish Latte, 1x Blueberry Muffin',
    total: 175,
    status: OrderStatus.delivered,
    rating: 3,
  ),
];
