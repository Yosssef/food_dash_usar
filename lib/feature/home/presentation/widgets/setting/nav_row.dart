import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/home/presentation/widgets/setting/row_shell.dart';

class NavRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? trailingText;
  final VoidCallback? onTap;
  final Color? color;

  const NavRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailingText,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RowShell(
      icon: icon,
      label: label,
      color: color,
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: Text(
                trailingText!,
                style: TextStyle(
                  fontSize: 12.5.sp,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          if (onTap != null)
            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20.r),
        ],
      ),
    );
  }
}
