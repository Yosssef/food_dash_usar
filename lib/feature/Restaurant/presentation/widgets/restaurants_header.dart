import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopix_user/core/constant.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        child: Stack(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV7lfcr6LJCw4tkBD2v5AKauen6lYEpGldBEwKpDlRXA&s=10',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.fastfood, size: 40, color: Colors.grey),
                ),
              ),
            ),

            Positioned(
              top: 10.h,
              right: 12.w,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 36.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20.r,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 55.h,
              right: 12.w,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, kCart),
                child: Container(
                  width: 36.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.cartShopping,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20.r,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 10.h,
              left: 12.w,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 36.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20.r,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
