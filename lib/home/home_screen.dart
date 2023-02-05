import 'dart:io';

import 'package:bereal/core/providers/scroll_behavior.dart';
import 'package:bereal/core/ui/user_appbar_widget.dart';
import 'package:bereal/home/real_social_widget.dart';
import 'package:bereal/home/small_real_widget.dart';
import 'package:bereal/real_camera/real_camera_controller.dart';
import 'package:bereal/styles/theme_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final PageController _controller;
  late final ScrollController _scrollController;
  bool menuVisibility = true;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100) {
        setState(() {
          menuVisibility = false;
        });
      } else {
        setState(() {
          menuVisibility = true;
        });
      }
    });
  }

  Widget empty() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your friends haven’t posted their BeReal yet, be the first one.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => context.push('/camera'),
                style: ref.watch(stylesProvider).button.primary,
                child: const Text("Take your BeReal"))
          ],
        ));
  }

  Widget posted(XFile photo, XFile selfie) {
    return Padding(
      padding: const EdgeInsets.only(top: 130),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallRealWidget(photo: File(photo.path), selfie: File(selfie.path)),
          Flexible(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Your friends haven’t posted their BeReal yet. Add even more friends.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            context.push('/contact');
                          },
                          style: ref.watch(stylesProvider).button.primary,
                          child: const Text("+ Add friends"))
                    ],
                  )))
        ],
      ),
    );
  }

  Widget feed() {
    final scrollEnabled = ref.watch(scrollBehaviorProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
          physics: scrollEnabled ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
          itemCount: 3,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.only(top: 90),
                child: RealSocialWidget(),
              );
            } else {
              return const RealSocialWidget();
            }
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 20,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollEnabled = ref.watch(scrollBehaviorProvider);

    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        PageView(
          controller: _controller,
          physics: scrollEnabled ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            HapticFeedback.lightImpact();
          },
          children: [
            ref.watch(realCameraControllerProvider).maybeWhen(
                  orElse: () => empty(),
                  finalized: (selfie, photo) => posted(photo, selfie),
                ),
            feed(),
          ],
        ),
        UserAppBar(
          controller: _controller,
          isVisible: menuVisibility,
        )
      ],
    ));
  }
}
