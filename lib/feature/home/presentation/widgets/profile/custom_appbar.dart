import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({
    super.key,
    required this.scheme,
    required this.title,
  });
  final String title;

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w900,
            color: scheme.secondary,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, kSettings),
          child: Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: scheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.settings_outlined,
              color: scheme.secondary,
              size: 20.r,
            ),
          ),
        ),
      ],
    );
  }
}
