import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.r),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 5.r),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(
                      fontSize: 20.sp,

                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    "EGP 355",
                    style: TextStyle(
                      fontSize: 20.sp,

                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery fee",
                    style: TextStyle(
                      fontSize: 20.sp,

                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    "EGP 15",
                    style: TextStyle(
                      fontSize: 20.sp,

                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tax",
                    style: TextStyle(
                      fontSize: 20.sp,

                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    "EGP 18",
                    style: TextStyle(
                      fontSize: 20.sp,

                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              DashedDivider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    "EGP 388",
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  const DashedDivider({
    super.key,
    this.color = const Color(0xffBDBDBD),
    this.dashWidth = 6,
    this.dashSpace = 3,
    this.thickness = 1.4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final count = (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return SizedBox(
          height: thickness,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(count, (_) {
              return Padding(
                padding: EdgeInsets.only(right: dashSpace),
                child: Container(
                  width: dashWidth,
                  height: thickness,
                  color: color,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
