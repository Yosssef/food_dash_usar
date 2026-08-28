import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/cart/presentation/widgets/receipt.dart';
import 'package:shopix_user/feature/checkout/presentation/widgets/summary_row.dart';

class CheckoutReceipt extends StatelessWidget {
  const CheckoutReceipt({super.key, required this.scheme});

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: scheme.onPrimary,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
        child: Column(
          children: [
            SummaryRow(title: "Subtotal", value: "EGP 355"),
            SummaryRow(title: "Discount", value: "- EGP 71"),
            SizedBox(height: 10.h),
            const DashedDivider(),
            SizedBox(height: 10.h),
            SummaryRow(title: "Total", value: "EGP 317", isBold: true),
          ],
        ),
      ),
    );
  }
}
