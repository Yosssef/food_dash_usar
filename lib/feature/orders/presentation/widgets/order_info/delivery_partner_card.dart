import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/order_info/round_icon_button.dart';

class DeliveryPartnerCard extends StatelessWidget {
  final String initial;
  final String name;
  final String vehicle;
  final VoidCallback onCall;
  final VoidCallback onMessage;

  const DeliveryPartnerCard({
    super.key,
    required this.initial,
    required this.name,
    required this.vehicle,
    required this.onCall,
    required this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: scheme.onPrimary,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26.r,
            backgroundColor: scheme.secondary,
            child: Text(
              initial,
              style: TextStyle(
                color: scheme.onPrimary,
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name · $vehicle',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                    color: scheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  'Your delivery partner',
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          RoundIconButton(
            icon: Icons.phone,
            background: scheme.secondary,
            iconColor: scheme.onPrimary,
            onTap: onCall,
          ),
          SizedBox(width: 8.w),
          RoundIconButton(
            icon: Icons.chat_bubble_outline,
            background: scheme.secondary.withValues(alpha: 0.12),
            iconColor: scheme.secondary,
            onTap: onMessage,
          ),
        ],
      ),
    );
  }
}
