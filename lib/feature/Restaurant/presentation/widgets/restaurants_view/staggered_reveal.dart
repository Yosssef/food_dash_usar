import 'package:flutter/material.dart';

class StaggeredReveal extends StatefulWidget {
  final int index;
  final Widget child;

  const StaggeredReveal({super.key, required this.index, required this.child});

  @override
  State<StaggeredReveal> createState() => _StaggeredRevealState();
}

class _StaggeredRevealState extends State<StaggeredReveal> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    final delay = Duration(milliseconds: 60 * widget.index.clamp(0, 8));
    Future.delayed(delay, () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, 0.08),
        duration: const Duration(milliseconds: 380),
        curve: Curves.bounceInOut,
        child: widget.child,
      ),
    );
  }
}
