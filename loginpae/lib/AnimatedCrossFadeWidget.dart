import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  final Widget firstChild;
  final Widget secondChild;
  final bool showFirst;
  final VoidCallback onToggle;

  const AnimatedCrossFadeWidget({
    super.key,
    required this.firstChild,
    required this.secondChild,
    required this.showFirst,
    required this.onToggle,
  });

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState
    extends State<AnimatedCrossFadeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 900),
          sizeCurve: Curves.bounceOut,
          crossFadeState: widget.showFirst
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: widget.firstChild,
          secondChild: widget.secondChild,
        ),

        // Optional floating animation control
        Positioned(
          right: 12,
          bottom: 12,
          child: FloatingActionButton.small(
            heroTag: 'crossFadeButton',
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            onPressed: widget.onToggle,
            child: const Icon(Icons.swap_horiz),
          ),
        ),
      ],
    );
  }
}