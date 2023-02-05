import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_behavior.g.dart';

@riverpod
class ScrollBehavior extends _$ScrollBehavior {
  @override
  bool build() {
    return true;
  }

  void enable(bool value) {
    state = value;
  }
}
