import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/checkout/presentation/widgets/checkout_header.dart';
import 'package:shopix_user/feature/checkout/presentation/widgets/checkout_receipt.dart';
import 'package:shopix_user/feature/checkout/presentation/widgets/checkout_states.dart';
import 'package:shopix_user/feature/checkout/presentation/widgets/option_card.dart';
import 'package:shopix_user/feature/checkout/presentation/widgets/place_order.dart';

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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                child: Column(
                  children: [
                    CheckoutHaeder(scheme: scheme),
                    SizedBox(height: 30.h),

                    CheckoutStates(
                      isPickup: isPickup,
                      ondeliverytap: () => setState(() => isPickup = false),
                      onpickuptap: () => setState(() => isPickup = true),
                    ),
                    SizedBox(height: 20.h),

                    OptionCard(
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

                    OptionCard(
                      icon: Icons.account_balance_wallet_outlined,
                      title: isPickup ? "Pay at Store" : "Cash on delivery",
                      subtitle: isPickup
                          ? "Pay when you pick up your order"
                          : "Pay when the order arrives",
                      onChangeTap: () {},
                      accentColor: scheme.primary,
                    ),
                    SizedBox(height: 20.h),

                    CheckoutReceipt(scheme: scheme),

                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),

            PlaceOrderButton(scheme: scheme),
          ],
        ),
      ),
    );
  }
}
