import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({super.key, required this.scheme});

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.w,
      right: 20.w,
      bottom: 15.h,
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        onTap: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: scheme.secondary,
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            boxShadow: [
              BoxShadow(
                color: scheme.secondary.withValues(alpha: 0.35),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Center(
              child: Text(
                "Place order · EGP 317",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: scheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
