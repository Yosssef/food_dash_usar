import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.primary,
                    ),

                    Text("4.8 (320)", style: TextStyle(fontSize: 18.sp)),
                  ],
                ),

                Text("American", style: TextStyle(fontSize: 18.sp)),

                Text("1.2 Km", style: TextStyle(fontSize: 18.sp)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20.w),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(30),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "20-30 min",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withAlpha(30),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Free delivery over 450 EGP",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
