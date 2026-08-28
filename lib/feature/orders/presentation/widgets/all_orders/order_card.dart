import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/orders/presentation/views/all_orders.dart';
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
            color: scheme.onPrimary,

            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
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
                        color: const Color(0xffFAF6EF),
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
                                'EGP ${order.total.toInt()} ',
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
                        ? OutlineButton(label: 'Reorder', onTap: onReorder)
                        : null,
                    ?order.status != OrderStatus.delivered
                        ? null
                        : Row(
                            children: [
                              OutlineButton(label: 'Rate', onTap: onRate),
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
