import 'package:flutter/material.dart';

class SlideUpRoute extends PageRouteBuilder {
  final Widget page;

  SlideUpRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.easeInOutCubic;
            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionDuration: const Duration(milliseconds: 300),
        );
}
