import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  bool isPickup = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 20.h,
                  bottom: 90.h,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: scheme.onPrimary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: scheme.secondary,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "Checkout",
                          style: TextStyle(
                            color: scheme.secondary,
                            fontSize: 27.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),

                    Row(
                      children: [
                        Expanded(
                          child: _ToggleTab(
                            label: "Delivery",
                            selected: !isPickup,
                            color: scheme.secondary,
                            onTap: () => setState(() => isPickup = false),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: _ToggleTab(
                            label: "Pickup",
                            selected: isPickup,
                            color: scheme.secondary,
                            onTap: () => setState(() => isPickup = true),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    _buildOptionCard(
                      context,
                      icon: isPickup
                          ? Icons.storefront_rounded
                          : Icons.location_on_outlined,
                      title: isPickup ? "Select Store Branch" : "Home",
                      subtitle: isPickup
                          ? "Nasr City Branch (14 Abbas El Akkad)"
                          : "14 Abbas El Akkad St, Nasr City",
                      onChangeTap: () {},
                      accentColor: scheme.secondary,
                    ),
                    SizedBox(height: 15.h),

                    _buildOptionCard(
                      context,
                      icon: Icons.account_balance_wallet_outlined,
                      title: isPickup ? "Pay at Store" : "Cash on delivery",
                      subtitle: isPickup
                          ? "Pay when you pick up your order"
                          : "Pay when the order arrives",
                      onChangeTap: () {},
                      accentColor: scheme.primary,
                    ),
                    SizedBox(height: 20.h),

                    Container(
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
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 25.w,
                        ),
                        child: Column(
                          children: [
                            _buildSummaryRow(
                              context,
                              title: "Subtotal",
                              value: "EGP 355",
                            ),
                            _buildSummaryRow(
                              context,
                              title: "Discount",
                              value: "- EGP 71",
                            ),
                            SizedBox(height: 10.h),
                            const DashedDivider(),
                            SizedBox(height: 10.h),
                            _buildSummaryRow(
                              context,
                              title: "Total",
                              value: "EGP 317",
                              isBold: true,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Reserved space so the floating button never covers the
                    // last card, and so the page can scroll past it if needed.
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 15.h,
              child: InkWell(
                borderRadius: BorderRadius.circular(15.r),
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: scheme.secondary,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    boxShadow: [
                      BoxShadow(
                        color: scheme.secondary.withValues(alpha: 0.35),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Center(
                      child: Text(
                        "Place order · EGP 317",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: scheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onChangeTap,
    required Color accentColor,
  }) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(icon, color: accentColor, size: 26.r),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: scheme.onSurface,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onChangeTap,
            child: Text(
              "Change",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context, {
    required String title,
    required String value,
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isBold ? 18.sp : 16.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isBold
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.grey.shade600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 18.sp : 16.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleTab extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _ToggleTab({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? color : Colors.grey.shade300,
            width: 2.5,
          ),
          color: selected
              ? color.withValues(alpha: 0.1)
              : Theme.of(context).colorScheme.onPrimary,
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: selected ? FontWeight.w900 : FontWeight.w600,
              color: selected ? color : Colors.grey.shade500,
            ),
          ),
        ),
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  const DashedDivider({
    super.key,
    this.color = const Color(0xffBDBDBD),
    this.dashWidth = 6,
    this.dashSpace = 5,
    this.thickness = 1.4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final count = (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return SizedBox(
          height: thickness,
          width: double.infinity,
          child: Row(
            children: List.generate(count, (_) {
              return Padding(
                padding: EdgeInsets.only(right: dashSpace),
                child: Container(
                  width: dashWidth,
                  height: thickness,
                  color: color,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
