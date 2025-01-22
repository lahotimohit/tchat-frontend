import 'package:flutter/material.dart';

class LoginScreenAnimations {
  final AnimationController animationController;
  final Animation<double> imageAnimation;
  final Animation<double> welcomeTextAnimation;
  final Animation<double> subtitleAnimation;
  final Animation<double> emailFieldAnimation;
  final Animation<double> phoneFieldAnimation;
  final Animation<double> buttonAnimation;
  final Animation<double> backButtonAnimation;

  LoginScreenAnimations(this.animationController)
      : imageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
          ),
        ),
        backButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.1, 0.6, curve: Curves.easeOut),
          ),
        ),
        welcomeTextAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.2, 0.7, curve: Curves.easeOut),
          ),
        ),
        subtitleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
          ),
        ),
        emailFieldAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.4, 0.9, curve: Curves.easeOut),
          ),
        ),
        phoneFieldAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
          ),
        ),
        buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
          ),
        );

  static Future<void> initialize(AnimationController controller) async {
    await Future.delayed(const Duration(milliseconds: 200));
    controller.forward();
  }
}
