import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/checkout/presentation/widgets/toggle_tab.dart';

class CheckoutStates extends StatelessWidget {
  final bool isPickup;
  final VoidCallback ondeliverytap;
  final VoidCallback onpickuptap;
  const CheckoutStates({
    super.key,
    required this.isPickup,
    required this.ondeliverytap,
    required this.onpickuptap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ToggleTab(
            label: "Delivery",
            selected: !isPickup,
            color: Theme.of(context).colorScheme.secondary,
            onTap: ondeliverytap,
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: ToggleTab(
            label: "Pickup",
            selected: isPickup,
            color: Theme.of(context).colorScheme.secondary,
            onTap: onpickuptap,
          ),
        ),
      ],
    );
  }
}
