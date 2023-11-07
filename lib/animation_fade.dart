
import 'dart:async';

import 'package:flutter/material.dart';

class ShowUpAnimationPage extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final int delay;
  const ShowUpAnimationPage({super.key,required this.duration,required this.child,required this.delay});
  @override
  createState() => _ShowUpAnimationPage();
}

class _ShowUpAnimationPage extends State<ShowUpAnimationPage> with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: widget.duration);
    final curve =
    CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, -0.05), end: Offset.zero)
            .animate(curve);
// ignore: unnecessary_null_comparison
    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
