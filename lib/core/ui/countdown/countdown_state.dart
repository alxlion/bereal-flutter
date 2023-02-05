import 'package:freezed_annotation/freezed_annotation.dart';

part 'countdown_state.freezed.dart';

extension CountdownGetters on CountdownState {
  bool get isInitial => this is _CountdownStateInitial;
  bool get isProgress => this is _CountdownStateProgress;
  bool get isFinished => this is _CountdownStateFinished;
}

@freezed
class CountdownState with _$CountdownState {
  const factory CountdownState.initial(Duration duration) = _CountdownStateInitial;
  const factory CountdownState.progress(Duration duration) = _CountdownStateProgress;
  const factory CountdownState.finished(Duration duration) = _CountdownStateFinished;
  const factory CountdownState.cancelled(Duration duration) = _CountdownStateCancelled;
}
