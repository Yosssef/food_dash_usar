import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/order_info/delivery_partner_card.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/order_info/order_info_haeder.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/order_info/order_tracking_card.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/order_info/tracking_map.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/order_info/tracking_step_row.dart';

class OrdersInfo extends StatelessWidget {
  const OrdersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OrderInfoHeader(),
                TrackingMap(),
                SizedBox(height: 20.h),
                DeliveryPartnerCard(
                  initial: 'M',
                  name: 'Mostafa',
                  vehicle: 'Honda 125',
                  onCall: () {},
                  onMessage: () {},
                ),
                SizedBox(height: 16.h),
                OrderTrackingCard(
                  steps: const [
                    TrackingStep(
                      label: 'Order confirmed',
                      time: '6:02 PM',
                      isDone: true,
                    ),
                    TrackingStep(
                      label: 'Preparing your food',
                      time: '6:05 PM',
                      isDone: true,
                    ),
                    TrackingStep(
                      label: 'Out for delivery',
                      time: '6:21 PM',
                      isDone: true,
                    ),
                    TrackingStep(label: 'Delivered', isDone: false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
