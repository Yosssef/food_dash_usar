import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class OrderRestaurant extends StatelessWidget {
  const OrderRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Pizza Hat",
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
