import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

enum OrderStatus { delivered, cancelled, preparing }

class StatusPill extends StatelessWidget {
  final OrderStatus status;
  const StatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    late final Color fg;
    late final Color bg;
    late final String label;

    switch (status) {
      case OrderStatus.delivered:
        fg = Theme.of(context).colorScheme.secondary;
        bg = Theme.of(context).colorScheme.secondary.withValues(alpha: 0.12);
        label = 'Delivered';
        break;
      case OrderStatus.cancelled:
        fg = Theme.of(context).colorScheme.error;
        bg = Theme.of(context).colorScheme.error.withValues(alpha: 0.1);
        label = 'Cancelled';
        break;
      case OrderStatus.preparing:
        fg = Theme.of(context).colorScheme.primary;
        bg = Theme.of(context).colorScheme.primary.withValues(alpha: 0.12);
        label = 'Preparing';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 4.r),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11.sp,
          color: fg,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
