import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const OutlineButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Colors.grey.shade300, width: 1.3),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 14.w),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
