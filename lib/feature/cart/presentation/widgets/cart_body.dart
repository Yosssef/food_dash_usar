import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/cart/presentation/widgets/cart_haeder.dart';
import 'package:shopix_user/feature/cart/presentation/widgets/coupon_textfeild.dart';
import 'package:shopix_user/feature/cart/presentation/widgets/order_details.dart';
import 'package:shopix_user/feature/cart/presentation/widgets/receipt.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: 90.h,
          ),
          child: Column(
            children: [CartHaeder(), OrdarDatiel(), Coupon(), Receipt()],
          ),
        ),
      ),
    );
  }
}
