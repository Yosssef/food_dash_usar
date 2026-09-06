import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class FavoriteHeartButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const FavoriteHeartButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  State<FavoriteHeartButton> createState() => _FavoriteHeartButtonState();
}

class _FavoriteHeartButtonState extends State<FavoriteHeartButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
    lowerBound: 0.1,
    upperBound: 1.0,
  )..value = 1;

  late final Animation<double> _scale = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    widget.onTap();
    _controller
      ..value = 0.1
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
            color: Theme.of(context).colorScheme.error,
            size: 22.r,
          ),
        ),
      ),
    );
  }
}
