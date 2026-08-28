import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class StarsDisplay extends StatelessWidget {
  final double rating;
  const StarsDisplay({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xffE0A23A);
    return Row(
      children: List.generate(5, (i) {
        return Icon(
          Icons.star,
          size: 16.r,
          color: i < rating.round() ? gold : Colors.grey.shade300,
        );
      }),
    );
  }
}
