import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class MenuHeaderButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color color;

  const MenuHeaderButton({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20.r),
          border: selected ? Border.all(color: color, width: 1.4) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: selected ? FontWeight.w800 : FontWeight.normal,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
