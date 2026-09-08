import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/round_ghost_button.dart';

class CustomRestaurantsAppBar extends StatelessWidget {
  const CustomRestaurantsAppBar({
    super.key,
    required this.expandedHeight,
    required this.scheme,
    required this.widget,
    required this.collapseT,
    required this.title,
  });

  final double expandedHeight;
  final ColorScheme scheme;
  final RestaurantsResultsView widget;
  final ValueNotifier<double> collapseT;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight.h,
      backgroundColor: scheme.surface,
      surfaceTintColor: scheme.surface,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: widget.mode == ResultsMode.favorites
          ? null
          : Padding(
              padding: EdgeInsets.all(8.r),
              child: ValueListenableBuilder<double>(
                valueListenable: collapseT,
                builder: (context, t, child) {
                  final scale = 1.0 - (t * 0.3);
                  return Transform.scale(scale: scale, child: child);
                },
                child: RoundGhostButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(bottom: 16.h),
        title: ValueListenableBuilder<double>(
          valueListenable: collapseT,
          builder: (context, t, child) {
            final double maxLeftPadding = widget.mode == ResultsMode.favorites
                ? 20.w
                : 45.w;

            final double dynamicLeftPadding =
                20.w + ((maxLeftPadding - 20.w) * t);

            return Padding(
              padding: EdgeInsets.only(
                left: context.isarbic() ? 0 : dynamicLeftPadding,
                right: context.isarbic() ? dynamicLeftPadding : 0,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w900,
                  color: scheme.secondary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
