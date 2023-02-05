import 'package:animate_do/animate_do.dart';
import 'package:bereal/home/real_widget.dart';
import 'package:bereal/styles/theme_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RealSocialWidget extends ConsumerStatefulWidget {
  const RealSocialWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RealSocialWidgetState();
}

class _RealSocialWidgetState extends ConsumerState<RealSocialWidget> {
  bool _reactOpen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _reaction(text, delay) {
    return ZoomIn(
        animate: _reactOpen,
        delay: Duration(milliseconds: delay),
        child: SizedBox(
            width: 60,
            height: 60,
            child: TextButton(
                onPressed: () {
                  return;
                },
                child: DottedBorder(
                    color: Colors.grey.shade200,
                    dashPattern: const [6, 4],
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(100),
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: defaultTargetPlatform == TargetPlatform.iOS ? 6 : 8),
                    child: Text(text,
                        style: TextStyle(fontSize: defaultTargetPlatform == TargetPlatform.iOS ? 23 : 20))))));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: defaultTargetPlatform == TargetPlatform.iOS ||
                                    defaultTargetPlatform == TargetPlatform.android
                                ? CachedNetworkImage(fit: BoxFit.cover, imageUrl: "https://i.pravatar.cc/100?img=50")
                                : Image.network(fit: BoxFit.cover, "https://i.pravatar.cc/100?img=50"))),
                    const SizedBox(width: 10),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "John Doe",
                              style: ref.watch(stylesProvider).text.bodySmallBold,
                            ),
                            Text("Paris, France • 12:45:23", style: ref.watch(stylesProvider).text.bodySmall)
                          ],
                        ))
                  ],
                ),
                TextButton(
                  child: const Icon(Icons.more_horiz, size: 30),
                  onPressed: () {},
                )
              ],
            )),
        const SizedBox(height: 5),
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _reactOpen = false;
                });
              },
              child: const RealWidget(
                  selfie: "https://i.pravatar.cc/1000?img=6", photo: "https://picsum.photos/seed/123/1080/1920"),
            ),
            Visibility(
                visible: !_reactOpen,
                child: Positioned(
                  bottom: 10,
                  right: 10,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          _reactOpen = true;
                        });
                      },
                      child: const Icon(Icons.sentiment_satisfied_rounded, size: 40, shadows: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ])),
                )),
            Visibility(
                visible: _reactOpen,
                child: Positioned(
                    left: 0,
                    bottom: 0,
                    child: FadeIn(
                      duration: const Duration(milliseconds: 100),
                      animate: _reactOpen,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0, 0.5],
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        )),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _reaction("👍", 250),
                            _reaction("😃", 200),
                            _reaction("😮", 150),
                            _reaction("🥰", 100),
                            _reaction("😂", 50),
                            ZoomIn(
                              delay: const Duration(milliseconds: 0),
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: TextButton(
                                  onPressed: () {},
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: defaultTargetPlatform == TargetPlatform.iOS ? 6 : 8),
                                        color: Colors.black,
                                        child: Text(
                                          "⚡️",
                                          style: TextStyle(
                                              fontSize: defaultTargetPlatform == TargetPlatform.iOS ? 23 : 20),
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )))
          ],
        )
      ],
    );
  }
}
