import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class TrackingMap extends StatelessWidget {
  const TrackingMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withAlpha(100),
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      child: Icon(
        Icons.map_outlined,
        size: 100,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
