import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class RoundGhostButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const RoundGhostButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.r,
        height: 36.r,
        decoration: BoxDecoration(
          color: scheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: scheme.shadow.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 18.r,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
