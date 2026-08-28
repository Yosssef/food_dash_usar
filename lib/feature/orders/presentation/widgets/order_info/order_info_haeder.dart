import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class OrderInfoHeader extends StatelessWidget {
  const OrderInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Column(
            children: [
              Text(
                "Order #10482",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 27.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Arriving in  ~12 min",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
