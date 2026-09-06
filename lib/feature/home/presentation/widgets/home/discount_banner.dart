import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.r),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary.withAlpha(230),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 15.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "20% off your first order",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "use code WELCOME20",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15.w),
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary.withAlpha(50),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(
              Icons.discount_outlined,
              size: 32.r,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
