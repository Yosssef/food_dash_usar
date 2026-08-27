import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

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
                Padding(
                  padding: EdgeInsets.only(bottom: 20.r),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        children: [
                          Text(
                            "Order #10482",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 27.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Arriving in  ~12 min",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(100),
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  ),
                  child: Icon(Icons.map_outlined, size: 100),
                ),
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

class DeliveryPartnerCard extends StatelessWidget {
  final String initial; // shown inside the avatar circle, e.g. "M"
  final String name; // e.g. "Mostafa"
  final String vehicle; // e.g. "Honda 125"
  final VoidCallback onCall;
  final VoidCallback onMessage;

  const DeliveryPartnerCard({
    super.key,
    required this.initial,
    required this.name,
    required this.vehicle,
    required this.onCall,
    required this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: scheme.onPrimary,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26.r,
            backgroundColor: scheme.secondary,
            child: Text(
              initial,
              style: TextStyle(
                color: scheme.onPrimary,
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name · $vehicle',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                    color: scheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  'Your delivery partner',
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          _RoundIconButton(
            icon: Icons.phone,
            background: scheme.secondary,
            iconColor: scheme.onPrimary,
            onTap: onCall,
          ),
          SizedBox(width: 8.w),
          _RoundIconButton(
            icon: Icons.chat_bubble_outline,
            background: scheme.secondary.withValues(alpha: 0.12),
            iconColor: scheme.secondary,
            onTap: onMessage,
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color background;
  final Color iconColor;
  final VoidCallback onTap;

  const _RoundIconButton({
    required this.icon,
    required this.background,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22.r),
      child: Container(
        width: 44.r,
        height: 44.r,
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 19.r),
      ),
    );
  }
}

/// ------------------------- Order tracking timeline -------------------------

class TrackingStep {
  final String label;
  final String? time; // null while this step hasn't happened yet
  final bool isDone;

  const TrackingStep({required this.label, this.time, required this.isDone});
}

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
        color: scheme.onPrimary,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: List.generate(steps.length, (index) {
          final step = steps[index];
          final isLast = index == steps.length - 1;
          // The connecting line only looks "complete" when the step it
          // leads INTO is also done — otherwise it fades, matching the
          // reference design.
          final lineIsDone = !isLast && step.isDone && steps[index + 1].isDone;

          return _TrackingStepRow(
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

class _TrackingStepRow extends StatelessWidget {
  final TrackingStep step;
  final bool isLast;
  final bool lineIsDone;
  final Color accent;

  const _TrackingStepRow({
    required this.step,
    required this.isLast,
    required this.lineIsDone,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final dotColor = step.isDone ? accent : Colors.grey.shade300;
    final lineColor = lineIsDone ? accent : Colors.grey.shade300;
    final labelColor = step.isDone
        ? Theme.of(context).colorScheme.onSurface
        : Colors.grey.shade400;
    final timeColor = step.isDone ? Colors.grey.shade500 : Colors.grey.shade400;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 14.r,
                height: 14.r,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(child: Container(width: 2.5, color: lineColor)),
            ],
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.label,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: labelColor,
                    ),
                  ),
                  if (step.time != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      step.time!,
                      style: TextStyle(fontSize: 12.5.sp, color: timeColor),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
