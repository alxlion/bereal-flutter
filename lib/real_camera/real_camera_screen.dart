import 'dart:io';

import 'package:bereal/core/ui/countdown/countdown_controller.dart';
import 'package:bereal/core/ui/countdown/countdown_state.dart';
import 'package:bereal/core/ui/countdown/countdown_widget.dart';
import 'package:bereal/home/real_widget.dart';
import 'package:bereal/real_camera/real_camera_controller.dart';
import 'package:bereal/styles/theme_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RealCameraScreen extends ConsumerStatefulWidget {
  const RealCameraScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RealCameraScreenState();
}

class _RealCameraScreenState extends ConsumerState<RealCameraScreen> with SingleTickerProviderStateMixin {
  late AnimationController _triggerBtnAnimationController;
  late Animation _triggerBtnAnimation;

  @override
  void initState() {
    super.initState();
    ref.read(realCameraControllerProvider.notifier).init();
    _triggerBtnAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _triggerBtnAnimation = Tween<double>(begin: 1, end: 0.8)
        .animate(CurvedAnimation(parent: _triggerBtnAnimationController, curve: Curves.easeInOut));
    _triggerBtnAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _triggerBtnAnimationController.reverse();
      }
    });
  }

  @override
  void didUpdateWidget(oldWidget) {
    ref.read(realCameraControllerProvider.notifier).dispose();
    ref.read(countdownControllerProvider.notifier).dispose();
    _triggerBtnAnimationController.dispose();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(countdownControllerProvider, (previous, CountdownState next) {
      if (next.isFinished) {
        context.pop();
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Image.asset('assets/img/logo.png', height: 40)),
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              const CountdownWidget(),
              const SizedBox(
                height: 10,
              ),
              ref.watch(realCameraControllerProvider).maybeWhen(
                    orElse: () => const SizedBox(),
                    initial: () => const Expanded(child: Center(child: CircularProgressIndicator())),
                    started: (cameraController) => Expanded(
                        child: SizedBox(
                      height: 550,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CameraPreview(cameraController),
                      ),
                    )),
                    captured: (image) => Stack(alignment: Alignment.center, children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 550,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              alignment: FractionalOffset.center,
                              image: FileImage(File(image.path)),
                            ))),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text("o",
                                  style: ref
                                      .watch(stylesProvider)
                                      .text
                                      .title
                                      .copyWith(color: Colors.transparent, fontSize: 50, shadows: [
                                    Shadow(
                                      blurRadius: 30.0,
                                      color: Colors.black.withAlpha(120),
                                      offset: const Offset(0, 0),
                                    ),
                                  ])),
                              const SizedBox(
                                  width: 30, height: 30, child: CircularProgressIndicator(color: Colors.white))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text("Wait, wait, smile !",
                              style:
                                  ref.watch(stylesProvider).text.bodyBold.copyWith(color: Colors.white, shadows: const [
                                Shadow(
                                  blurRadius: 30.0,
                                  color: Colors.black,
                                  offset: Offset(0, 0),
                                ),
                              ]))
                        ],
                      )
                    ]),
                    finalized: (selfie, photo) => Stack(alignment: Alignment.topCenter, children: [
                      RealWidget(selfie: selfie.path, photo: photo.path),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              ref.read(realCameraControllerProvider.notifier).init();
                            },
                            icon: const Icon(Icons.close)),
                      )
                    ]),
                  ),
              const SizedBox(
                height: 30,
              ),
              ref.watch(realCameraControllerProvider).maybeWhen(
                    orElse: () => const SizedBox(),
                    started: (cameraController) => Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              _triggerBtnAnimationController.forward();
                              ref.read(realCameraControllerProvider.notifier).takePhoto();
                            },
                            child: AnimatedBuilder(
                              animation: _triggerBtnAnimationController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _triggerBtnAnimation.value,
                                  child: child,
                                );
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 5),
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: const SizedBox(),
                              ),
                            )),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    finalized: (selfie, photo) => TextButton(
                        style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          context.pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "SEND",
                              style: ref.watch(stylesProvider).text.title,
                            ),
                            const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 40,
                            )
                          ],
                        )),
                  ),
            ],
          ),
        ));
  }
}
