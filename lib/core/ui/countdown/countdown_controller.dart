import 'dart:async';

import 'package:bereal/core/ui/countdown/countdown_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'countdown_controller.g.dart';

@riverpod
class CountdownController extends _$CountdownController {
  late Timer _timer;

  @override
  CountdownState build() {
    return const CountdownState.initial(Duration(minutes: 2));
  }

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void dispose() {
    if (_timer.isActive) _timer.cancel();
  }

  void cancel() {
    _timer.cancel();
    state = CountdownState.cancelled(state.duration);
  }

  void _onTick(Timer timer) {
    state = CountdownState.progress(state.duration - const Duration(seconds: 1));

    if (state.duration.inSeconds == 0) {
      timer.cancel();
      state = CountdownState.finished(state.duration);
    }
  }
}
