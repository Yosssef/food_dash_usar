import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/favorite_heart.dart';

class RestaurantResultCard extends StatelessWidget {
  final RestaurantResultModel restaurant;
  final VoidCallback onToggleFavorite;
  final VoidCallback onTap;

  const RestaurantResultCard({
    super.key,
    required this.restaurant,
    required this.onToggleFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 270.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                restaurant.imageUrl,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Container(color: Colors.grey.shade200);
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  child: Icon(
                    Icons.fastfood,
                    size: 100.r,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                    stops: [0.4, 1.0],
                  ),
                ),
              ),

              Positioned(
                top: 12.h,
                right: 12.w,
                child: FavoriteHeartButton(
                  isFavorite: restaurant.isFavorite,
                  onTap: onToggleFavorite,
                ),
              ),

              Positioned(
                left: 16.w,
                right: 16.w,
                bottom: 14.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Icon(Icons.star, size: 15.r, color: Colors.amber),
                        SizedBox(width: 3.w),
                        Text(
                          restaurant.rating.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.5.sp,
                          ),
                        ),
                        _dot(),
                        Icon(
                          Icons.access_time_rounded,
                          size: 14.r,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          "${restaurant.deliveryTime} ${context.tr('restaurant.minute')} ",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.5.sp,
                          ),
                        ),
                        _dot(),
                        Text(
                          '${restaurant.distanceKm.toStringAsFixed(1)} ${context.tr('restaurant.Km')} ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12.5.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 6.w),
    child: Container(
      width: 3,
      height: 3,
      decoration: const BoxDecoration(
        color: Colors.white70,
        shape: BoxShape.circle,
      ),
    ),
  );
}
