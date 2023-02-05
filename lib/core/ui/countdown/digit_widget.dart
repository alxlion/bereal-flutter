import 'package:bereal/styles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DigitWidget extends ConsumerStatefulWidget {
  const DigitWidget({super.key, required this.currentDigit, required this.nextDigit, required this.style});

  final int currentDigit;
  final int nextDigit;
  final TextStyle style;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DigitWidgetState();
}

class _DigitWidgetState extends ConsumerState<DigitWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimationOne;
  late Animation<Offset> _offsetAnimationTwo;

  late Animation<double> _opacityAnimationOne;
  late Animation<double> _opacityAnimationTwo;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _offsetAnimationOne = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -0.5),
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _opacityAnimationOne = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.2, 0.3, curve: Curves.ease)));

    _opacityAnimationTwo = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.3, 1, curve: Curves.ease)));

    _offsetAnimationTwo = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //_animationController.reset();
        }
      }));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.reset();
    _animationController.forward();

    if (widget.currentDigit == widget.nextDigit) {
      return Text(widget.currentDigit.toString(), style: widget.style);
    } else {
      return AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: _opacityAnimationOne.value,
                  child: ClipRect(
                    clipper: DigitClipper(),
                    child: FractionalTranslation(
                        translation: _offsetAnimationOne.value,
                        child: Text(widget.currentDigit.toString(), style: widget.style)),
                  ),
                ),
                Opacity(
                  opacity: _opacityAnimationTwo.value,
                  child: ClipRect(
                    clipper: DigitClipper(),
                    child: FractionalTranslation(
                        translation: _offsetAnimationTwo.value,
                        child: Text(widget.nextDigit.toString(), style: widget.style)),
                  ),
                )
              ],
            );
          });
    }
  }
}

class DigitClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
