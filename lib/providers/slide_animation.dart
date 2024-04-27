import 'package:flutter/material.dart';

enum SlideDirection {
  none,
  rightWay,
  leftWay,
  rightIn,
  leftIn,
  upIn,
  bottomIn,
  bottomRightIn,
  topRightIn,
  topLeftIn,
  bottomLeftIn
}

class SlideAnimation extends StatefulWidget {
  const SlideAnimation(
      {super.key,
      required this.child,
      required this.slideDirection,
      this.isAnimate = true,
      this.isReset,
      this.isAnimationCompleted});
  final Widget child;
  final SlideDirection slideDirection;
  final bool isAnimate;
  final bool? isReset;
  final VoidCallback? isAnimationCompleted;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        if (animationController.isCompleted) {
          widget.isAnimationCompleted?.call();
        }
      });

    if (widget.isAnimate) {
      animationController.forward();
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant SlideAnimation oldWidget) {
    if (widget.isReset == true) {
      animationController.reset();
    }
    if (widget.isAnimate) {
      animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<Offset> animation;
    Tween<Offset> tween;

    switch (widget.slideDirection) {
      case SlideDirection.rightWay:
        tween = Tween(begin: const Offset(0, 0), end: const Offset(-1, 0));
        break;
      case SlideDirection.leftWay:
        tween = Tween(begin: const Offset(0, 0), end: const Offset(1, 0));
        break;
      case SlideDirection.rightIn:
        tween = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
        break;
      case SlideDirection.leftIn:
        tween = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));
        break;
      case SlideDirection.upIn:
        tween = Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
        break;
      case SlideDirection.bottomIn:
        tween = Tween(begin: const Offset(0, -1), end: const Offset(0, 0));
        break;
      case SlideDirection.bottomRightIn:
        tween = Tween(begin: const Offset(1, 1), end: const Offset(0, 0));
        break;
      case SlideDirection.bottomLeftIn:
        tween = Tween(begin: const Offset(-1, 1), end: const Offset(0, 0));
        break;
      case SlideDirection.topRightIn:
        tween = Tween(begin: const Offset(1, -1), end: const Offset(0, 0));
        break;
      case SlideDirection.topLeftIn:
        tween = Tween(begin: const Offset(-1, -1), end: const Offset(0, 0));
        break;
      default:
        tween = Tween(begin: const Offset(0, 0), end: const Offset(0, 0));
        break;
    }
    animation = tween.animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}
