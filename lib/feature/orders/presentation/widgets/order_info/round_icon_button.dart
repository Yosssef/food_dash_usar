import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color background;
  final Color iconColor;
  final VoidCallback onTap;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.background,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22.r),
      child: Container(
        width: 44.r,
        height: 44.r,
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 19.r),
      ),
    );
  }
}
