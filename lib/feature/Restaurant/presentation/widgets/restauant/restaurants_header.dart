import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/core/localization/app_strings.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isaarbic = context.isarbic();
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
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: Center(
                  child: Icon(
                    Icons.fastfood,
                    size: 100.r,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),

            FavouratButton(),

            Positioned(
              top: 55.h,
              right: isaarbic ? null : 12.w,
              left: isaarbic ? 12.w : null,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, kCart),
                child: SizedBox(
                  width: 40.r,
                  height: 40.r,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
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

                      Positioned(
                        top: 0,
                        right: isaarbic ? null : 0,
                        left: isaarbic ? 0 : null,
                        child: Container(
                          padding: EdgeInsets.all(2.r),
                          constraints: BoxConstraints(
                            minWidth: 16.r,
                            minHeight: 16.r,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              right: isaarbic ? 12.w : null,
              left: isaarbic ? null : 12.w,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 36.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
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

class FavouratButton extends StatefulWidget {
  const FavouratButton({super.key});

  @override
  State<FavouratButton> createState() => _FavouratButtonState();
}

class _FavouratButtonState extends State<FavouratButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final isaarbic = context.isarbic();
    return Positioned(
      top: 10.h,
      left: isaarbic ? 12.w : null,
      right: isaarbic ? null : 12.w,
      child: GestureDetector(
        onTap: () => setState(() {
          isFavorite = !isFavorite;
        }),
        child: Container(
          width: 36.r,
          height: 36.r,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).colorScheme.primary,
              size: 20.r,
            ),
          ),
        ),
      ),
    );
  }
}
