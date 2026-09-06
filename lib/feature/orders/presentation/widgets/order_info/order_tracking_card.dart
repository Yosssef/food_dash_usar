import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/order_info/tracking_step_row.dart';

class OrderTrackingCard extends StatelessWidget {
  final List<TrackingStep> steps;

  const OrderTrackingCard({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 18.r),
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: List.generate(steps.length, (index) {
          final step = steps[index];
          final isLast = index == steps.length - 1;
          final lineIsDone = !isLast && step.isDone && steps[index + 1].isDone;

          return TrackingStepRow(
            step: step,
            isLast: isLast,
            lineIsDone: lineIsDone,
            accent: scheme.secondary,
          );
        }),
      ),
    );
  }
}
