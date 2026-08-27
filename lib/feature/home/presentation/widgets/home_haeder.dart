import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeHader extends StatelessWidget {
  const HomeHader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20.r,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Text(
                  'Deliver to',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            Text(
              'Nasr City, Cairo',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(19.r)),
            border: Border.all(color: Colors.black12),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: IconButton(
            icon: const Icon(Icons.person_outline_outlined),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
