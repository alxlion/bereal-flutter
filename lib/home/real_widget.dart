import 'dart:io';
import 'dart:math' as math;

import 'package:bereal/core/providers/scroll_behavior.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RealWidget extends ConsumerStatefulWidget {
  const RealWidget({Key? key, required this.selfie, required this.photo}) : super(key: key);

  final String photo;
  final String selfie;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RealWidgetState();
}

class _RealWidgetState extends ConsumerState<RealWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Offset _offset;
  final GlobalKey _key = GlobalKey();
  final GlobalKey _childKey = GlobalKey();

  final double _margin = 10;

  late File _smallPhoto;
  late File _bigPhoto;

  @override
  void initState() {
    super.initState();
    _offset = Offset(_margin, _margin);
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _animationController.addListener(() {
      setState(() {
        _offset = _animation.value;
      });
    });

    _setPhotos(small: widget.selfie, big: widget.photo);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _setPhotos({required String small, required String big}) {
    setState(() {
      _smallPhoto = File(small);
      _bigPhoto = File(big);
    });
  }

  Offset _getFinalOffset() {
    var width = _key.currentContext!.size!.width;
    var height = _key.currentContext!.size!.height;
    var childWidth = _childKey.currentContext!.size!.width;
    var childHeight = _childKey.currentContext!.size!.height;

    var finalWidth = _margin;
    var finalHeight = _margin;

    if (_offset.dx > width / 2) {
      finalWidth = width - childWidth - _margin;
    }

    if (_offset.dy >= height / 2) {
      finalHeight = height - childHeight - _margin;
    }

    return Offset(finalWidth, finalHeight);
  }

  void _runAnimation() {
    _animation = _animationController.drive(
      Tween<Offset>(
        begin: _offset,
        end: _getFinalOffset(),
      ),
    );
    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -1);

    _animationController.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        key: _key,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: FractionalOffset.center,
              image: File(_bigPhoto.path).existsSync()
                  ? FileImage(_bigPhoto)
                  : defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS
                      ? CachedNetworkImageProvider(_bigPhoto.path) as ImageProvider
                      : NetworkImage(_bigPhoto.path),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: _offset.dx,
                top: _offset.dy,
                child: GestureDetector(
                  onTap: () {},
                  onDoubleTap: () {
                    _setPhotos(small: _bigPhoto.path, big: _smallPhoto.path);
                    ref.read(scrollBehaviorProvider.notifier).enable(true);
                  },
                  onPanDown: (details) {
                    _animationController.stop();
                    ref.read(scrollBehaviorProvider.notifier).enable(false);
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      _offset = Offset(_offset.dx + details.delta.dx, _offset.dy + details.delta.dy);
                    });
                  },
                  onPanEnd: (details) {
                    _runAnimation();
                    ref.read(scrollBehaviorProvider.notifier).enable(true);
                  },
                  child: AbsorbPointer(
                    child: Transform(
                      transform: Matrix4.rotationY(math.pi),
                      alignment: Alignment.center,
                      child: Container(
                        key: _childKey,
                        width: 140,
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: FractionalOffset.center,
                            image: _smallPhoto.existsSync()
                                ? FileImage(_smallPhoto)
                                : defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS
                                    ? CachedNetworkImageProvider(_smallPhoto.path) as ImageProvider
                                    : NetworkImage(_smallPhoto.path),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
