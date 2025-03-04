import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required AnimationController controller,
    required this.slideAnimation,
  }) : _controller = controller;

  final AnimationController _controller;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return SlideTransition(
          position: slideAnimation,
          child: Text('Read free books', textAlign: TextAlign.center),
        );
      },
    );
  }
}
