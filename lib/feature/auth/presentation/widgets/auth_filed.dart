import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;
  final Widget? trailing;
  final TextInputType? keyboardType;

  const AuthField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.trailing,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 14.5.sp, color: scheme.onSurface),
      decoration: InputDecoration(
        filled: true,
        fillColor: scheme.surface,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp),
        prefixIcon: Icon(icon, color: scheme.secondary, size: 20.r),
        suffixIcon: trailing,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
      ),
    );
  }
}
