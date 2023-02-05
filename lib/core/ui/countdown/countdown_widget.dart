import 'package:bereal/core/ui/countdown/countdown_controller.dart';
import 'package:bereal/core/ui/countdown/countdown_state.dart';
import 'package:bereal/core/ui/countdown/digit_widget.dart';
import 'package:bereal/styles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountdownWidget extends ConsumerStatefulWidget {
  const CountdownWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends ConsumerState<CountdownWidget> {
  late List<Widget> _digits;
  bool _redDigits = false;

  @override
  void initState() {
    super.initState();
    _digits = [
      const SizedBox(
        height: 30,
      )
    ];
    ref.read(countdownControllerProvider.notifier).start();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(countdownControllerProvider, (CountdownState? oldState, CountdownState newState) {
      if (newState.isProgress || newState.isInitial) {
        if (newState.duration.inSeconds == 30) {
          HapticFeedback.lightImpact();
        }
        if (newState.duration.inSeconds <= 10) {
          HapticFeedback.vibrate();
          setState(() {
            _redDigits = true;
          });
        }
        setState(() {
          _digits = [
            DigitWidget(
                currentDigit: int.parse(oldState!.duration.inMinutes.toString().padLeft(2, '0')[0]),
                nextDigit: int.parse(newState.duration.inMinutes.toString().padLeft(2, '0')[0]),
                style: _redDigits
                    ? ref.watch(stylesProvider).text.countdownRed
                    : ref.watch(stylesProvider).text.countdown),
            DigitWidget(
                currentDigit: int.parse(oldState.duration.inMinutes.toString().padLeft(2, '0')[1]),
                nextDigit: int.parse(newState.duration.inMinutes.toString().padLeft(2, '0')[1]),
                style: _redDigits
                    ? ref.watch(stylesProvider).text.countdownRed
                    : ref.watch(stylesProvider).text.countdown),
            Text(":",
                style: _redDigits
                    ? ref.watch(stylesProvider).text.countdownRed
                    : ref.watch(stylesProvider).text.countdown),
            DigitWidget(
                currentDigit: int.parse((oldState.duration.inSeconds % 60).toString().padLeft(2, '0')[0]),
                nextDigit: int.parse((newState.duration.inSeconds % 60).toString().padLeft(2, '0')[0]),
                style: _redDigits
                    ? ref.watch(stylesProvider).text.countdownRed
                    : ref.watch(stylesProvider).text.countdown),
            DigitWidget(
                currentDigit: int.parse((oldState.duration.inSeconds % 60).toString().padLeft(2, '0')[1]),
                nextDigit: int.parse((newState.duration.inSeconds % 60).toString().padLeft(2, '0')[1]),
                style: _redDigits
                    ? ref.watch(stylesProvider).text.countdownRed
                    : ref.watch(stylesProvider).text.countdown),
          ];
        });
      }
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: _digits,
    );
  }
}
