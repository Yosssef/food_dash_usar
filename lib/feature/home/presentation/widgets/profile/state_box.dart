import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class StatBox extends StatelessWidget {
  final String value;
  final String label;
  const StatBox({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w900,
              color: scheme.secondary,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
