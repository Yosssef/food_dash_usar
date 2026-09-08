import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/home/presentation/widgets/profile/state_box.dart';

class QuickData extends StatelessWidget {
  const QuickData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatBox(value: '18', label: context.tr("profile.orders_stat")),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: StatBox(
            value: '3',
            label: context.tr("profile.favorites_stat"),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: StatBox(
            value: '4.9',
            label: context.tr("profile.avg_rating_stat"),
          ),
        ),
      ],
    );
  }
}
