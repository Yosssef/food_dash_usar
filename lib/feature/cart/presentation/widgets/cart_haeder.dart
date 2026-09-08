import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';

class CartHaeder extends StatelessWidget {
  const CartHaeder({super.key});

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
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.shadow.withValues(alpha: 0.03),
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
        Text(
          context.tr("cart.your_cart"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 27.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
