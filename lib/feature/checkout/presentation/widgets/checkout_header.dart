import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CheckoutHaeder extends StatelessWidget {
  const CheckoutHaeder({super.key, required this.scheme});

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: scheme.onPrimary,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(Icons.arrow_back_ios_new, color: scheme.secondary),
          ),
        ),
        SizedBox(width: 15.w),
        Text(
          "Checkout",
          style: TextStyle(
            color: scheme.secondary,
            fontSize: 27.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
