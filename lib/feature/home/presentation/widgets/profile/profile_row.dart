import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class ProfileRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const ProfileRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tint = color ?? scheme.secondary;

    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: scheme.surfaceContainer,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: scheme.shadow.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(11.r),
                ),
                child: Icon(icon, color: tint, size: 18.r),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13.5.sp,
                    fontWeight: FontWeight.w700,
                    color: color ?? scheme.onSurface,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
                size: 20.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
