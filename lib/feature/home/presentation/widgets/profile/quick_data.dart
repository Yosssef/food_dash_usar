import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/home/presentation/widgets/profile/state_box.dart';

class QuickData extends StatelessWidget {
  const QuickData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatBox(value: '18', label: 'Orders'),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: StatBox(value: '3', label: 'Favorites'),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: StatBox(value: '4.9', label: 'Avg Rating'),
        ),
      ],
    );
  }
}
