import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class TrackingStepRow extends StatelessWidget {
  final TrackingStep step;
  final bool isLast;
  final bool lineIsDone;
  final Color accent;

  const TrackingStepRow({
    super.key,
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

class TrackingStep {
  final String label;
  final String? time;
  final bool isDone;

  const TrackingStep({required this.label, this.time, required this.isDone});
}
