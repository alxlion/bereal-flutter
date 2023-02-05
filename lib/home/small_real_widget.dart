import 'dart:io';
import 'dart:math' as math;

import 'package:bereal/styles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmallRealWidget extends ConsumerStatefulWidget {
  const SmallRealWidget({Key? key, required this.photo, required this.selfie}) : super(key: key);

  final File photo;
  final File selfie;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SmallRealWidgetState();
}

class _SmallRealWidgetState extends ConsumerState<SmallRealWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 160,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.center,
                  image: FileImage(widget.photo),
                )),
            child: Stack(
              children: [
                Positioned(
                    left: 50,
                    top: 5,
                    child: Transform(
                      transform: Matrix4.rotationY(math.pi),
                      child: Container(
                        height: 60,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              alignment: FractionalOffset.center,
                              image: FileImage(widget.selfie),
                            )),
                      ),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        TextButton(
            onPressed: () {},
            style: ref.watch(stylesProvider).button.textBtn,
            child: Text("Add legend...", style: ref.watch(stylesProvider).text.bodyReal)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Paris", style: ref.watch(stylesProvider).text.bodyRealSecondary),
            const SizedBox(width: 3),
            Text("•", style: ref.watch(stylesProvider).text.bodyRealSecondary),
            const SizedBox(width: 3),
            Text("12:53:22", style: ref.watch(stylesProvider).text.bodyRealSecondary),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                iconSize: 16,
                style: ref.watch(stylesProvider).button.btnFlat,
                color: ref.watch(themeProvider).colorScheme.primary.withAlpha(100))
          ],
        )
      ],
    );
  }
}
