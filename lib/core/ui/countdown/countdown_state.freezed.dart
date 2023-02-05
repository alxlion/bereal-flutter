// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'countdown_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountdownState {
  Duration get duration => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration duration) initial,
    required TResult Function(Duration duration) progress,
    required TResult Function(Duration duration) finished,
    required TResult Function(Duration duration) cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountdownStateInitial value) initial,
    required TResult Function(_CountdownStateProgress value) progress,
    required TResult Function(_CountdownStateFinished value) finished,
    required TResult Function(_CountdownStateCancelled value) cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountdownStateCopyWith<CountdownState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountdownStateCopyWith<$Res> {
  factory $CountdownStateCopyWith(
          CountdownState value, $Res Function(CountdownState) then) =
      _$CountdownStateCopyWithImpl<$Res>;
  $Res call({Duration duration});
}

/// @nodoc
class _$CountdownStateCopyWithImpl<$Res>
    implements $CountdownStateCopyWith<$Res> {
  _$CountdownStateCopyWithImpl(this._value, this._then);

  final CountdownState _value;
  // ignore: unused_field
  final $Res Function(CountdownState) _then;

  @override
  $Res call({
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
abstract class _$$_CountdownStateInitialCopyWith<$Res>
    implements $CountdownStateCopyWith<$Res> {
  factory _$$_CountdownStateInitialCopyWith(_$_CountdownStateInitial value,
          $Res Function(_$_CountdownStateInitial) then) =
      __$$_CountdownStateInitialCopyWithImpl<$Res>;
  @override
  $Res call({Duration duration});
}

/// @nodoc
class __$$_CountdownStateInitialCopyWithImpl<$Res>
    extends _$CountdownStateCopyWithImpl<$Res>
    implements _$$_CountdownStateInitialCopyWith<$Res> {
  __$$_CountdownStateInitialCopyWithImpl(_$_CountdownStateInitial _value,
      $Res Function(_$_CountdownStateInitial) _then)
      : super(_value, (v) => _then(v as _$_CountdownStateInitial));

  @override
  _$_CountdownStateInitial get _value =>
      super._value as _$_CountdownStateInitial;

  @override
  $Res call({
    Object? duration = freezed,
  }) {
    return _then(_$_CountdownStateInitial(
      duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_CountdownStateInitial implements _CountdownStateInitial {
  const _$_CountdownStateInitial(this.duration);

  @override
  final Duration duration;

  @override
  String toString() {
    return 'CountdownState.initial(duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountdownStateInitial &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_CountdownStateInitialCopyWith<_$_CountdownStateInitial> get copyWith =>
      __$$_CountdownStateInitialCopyWithImpl<_$_CountdownStateInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration duration) initial,
    required TResult Function(Duration duration) progress,
    required TResult Function(Duration duration) finished,
    required TResult Function(Duration duration) cancelled,
  }) {
    return initial(duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
  }) {
    return initial?.call(duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountdownStateInitial value) initial,
    required TResult Function(_CountdownStateProgress value) progress,
    required TResult Function(_CountdownStateFinished value) finished,
    required TResult Function(_CountdownStateCancelled value) cancelled,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CountdownStateInitial implements CountdownState {
  const factory _CountdownStateInitial(final Duration duration) =
      _$_CountdownStateInitial;

  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_CountdownStateInitialCopyWith<_$_CountdownStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CountdownStateProgressCopyWith<$Res>
    implements $CountdownStateCopyWith<$Res> {
  factory _$$_CountdownStateProgressCopyWith(_$_CountdownStateProgress value,
          $Res Function(_$_CountdownStateProgress) then) =
      __$$_CountdownStateProgressCopyWithImpl<$Res>;
  @override
  $Res call({Duration duration});
}

/// @nodoc
class __$$_CountdownStateProgressCopyWithImpl<$Res>
    extends _$CountdownStateCopyWithImpl<$Res>
    implements _$$_CountdownStateProgressCopyWith<$Res> {
  __$$_CountdownStateProgressCopyWithImpl(_$_CountdownStateProgress _value,
      $Res Function(_$_CountdownStateProgress) _then)
      : super(_value, (v) => _then(v as _$_CountdownStateProgress));

  @override
  _$_CountdownStateProgress get _value =>
      super._value as _$_CountdownStateProgress;

  @override
  $Res call({
    Object? duration = freezed,
  }) {
    return _then(_$_CountdownStateProgress(
      duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_CountdownStateProgress implements _CountdownStateProgress {
  const _$_CountdownStateProgress(this.duration);

  @override
  final Duration duration;

  @override
  String toString() {
    return 'CountdownState.progress(duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountdownStateProgress &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_CountdownStateProgressCopyWith<_$_CountdownStateProgress> get copyWith =>
      __$$_CountdownStateProgressCopyWithImpl<_$_CountdownStateProgress>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration duration) initial,
    required TResult Function(Duration duration) progress,
    required TResult Function(Duration duration) finished,
    required TResult Function(Duration duration) cancelled,
  }) {
    return progress(duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
  }) {
    return progress?.call(duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountdownStateInitial value) initial,
    required TResult Function(_CountdownStateProgress value) progress,
    required TResult Function(_CountdownStateFinished value) finished,
    required TResult Function(_CountdownStateCancelled value) cancelled,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class _CountdownStateProgress implements CountdownState {
  const factory _CountdownStateProgress(final Duration duration) =
      _$_CountdownStateProgress;

  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_CountdownStateProgressCopyWith<_$_CountdownStateProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CountdownStateFinishedCopyWith<$Res>
    implements $CountdownStateCopyWith<$Res> {
  factory _$$_CountdownStateFinishedCopyWith(_$_CountdownStateFinished value,
          $Res Function(_$_CountdownStateFinished) then) =
      __$$_CountdownStateFinishedCopyWithImpl<$Res>;
  @override
  $Res call({Duration duration});
}

/// @nodoc
class __$$_CountdownStateFinishedCopyWithImpl<$Res>
    extends _$CountdownStateCopyWithImpl<$Res>
    implements _$$_CountdownStateFinishedCopyWith<$Res> {
  __$$_CountdownStateFinishedCopyWithImpl(_$_CountdownStateFinished _value,
      $Res Function(_$_CountdownStateFinished) _then)
      : super(_value, (v) => _then(v as _$_CountdownStateFinished));

  @override
  _$_CountdownStateFinished get _value =>
      super._value as _$_CountdownStateFinished;

  @override
  $Res call({
    Object? duration = freezed,
  }) {
    return _then(_$_CountdownStateFinished(
      duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_CountdownStateFinished implements _CountdownStateFinished {
  const _$_CountdownStateFinished(this.duration);

  @override
  final Duration duration;

  @override
  String toString() {
    return 'CountdownState.finished(duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountdownStateFinished &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_CountdownStateFinishedCopyWith<_$_CountdownStateFinished> get copyWith =>
      __$$_CountdownStateFinishedCopyWithImpl<_$_CountdownStateFinished>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration duration) initial,
    required TResult Function(Duration duration) progress,
    required TResult Function(Duration duration) finished,
    required TResult Function(Duration duration) cancelled,
  }) {
    return finished(duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
  }) {
    return finished?.call(duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountdownStateInitial value) initial,
    required TResult Function(_CountdownStateProgress value) progress,
    required TResult Function(_CountdownStateFinished value) finished,
    required TResult Function(_CountdownStateCancelled value) cancelled,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _CountdownStateFinished implements CountdownState {
  const factory _CountdownStateFinished(final Duration duration) =
      _$_CountdownStateFinished;

  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_CountdownStateFinishedCopyWith<_$_CountdownStateFinished> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CountdownStateCancelledCopyWith<$Res>
    implements $CountdownStateCopyWith<$Res> {
  factory _$$_CountdownStateCancelledCopyWith(_$_CountdownStateCancelled value,
          $Res Function(_$_CountdownStateCancelled) then) =
      __$$_CountdownStateCancelledCopyWithImpl<$Res>;
  @override
  $Res call({Duration duration});
}

/// @nodoc
class __$$_CountdownStateCancelledCopyWithImpl<$Res>
    extends _$CountdownStateCopyWithImpl<$Res>
    implements _$$_CountdownStateCancelledCopyWith<$Res> {
  __$$_CountdownStateCancelledCopyWithImpl(_$_CountdownStateCancelled _value,
      $Res Function(_$_CountdownStateCancelled) _then)
      : super(_value, (v) => _then(v as _$_CountdownStateCancelled));

  @override
  _$_CountdownStateCancelled get _value =>
      super._value as _$_CountdownStateCancelled;

  @override
  $Res call({
    Object? duration = freezed,
  }) {
    return _then(_$_CountdownStateCancelled(
      duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_CountdownStateCancelled implements _CountdownStateCancelled {
  const _$_CountdownStateCancelled(this.duration);

  @override
  final Duration duration;

  @override
  String toString() {
    return 'CountdownState.cancelled(duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountdownStateCancelled &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_CountdownStateCancelledCopyWith<_$_CountdownStateCancelled>
      get copyWith =>
          __$$_CountdownStateCancelledCopyWithImpl<_$_CountdownStateCancelled>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Duration duration) initial,
    required TResult Function(Duration duration) progress,
    required TResult Function(Duration duration) finished,
    required TResult Function(Duration duration) cancelled,
  }) {
    return cancelled(duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
  }) {
    return cancelled?.call(duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Duration duration)? initial,
    TResult Function(Duration duration)? progress,
    TResult Function(Duration duration)? finished,
    TResult Function(Duration duration)? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CountdownStateInitial value) initial,
    required TResult Function(_CountdownStateProgress value) progress,
    required TResult Function(_CountdownStateFinished value) finished,
    required TResult Function(_CountdownStateCancelled value) cancelled,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CountdownStateInitial value)? initial,
    TResult Function(_CountdownStateProgress value)? progress,
    TResult Function(_CountdownStateFinished value)? finished,
    TResult Function(_CountdownStateCancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class _CountdownStateCancelled implements CountdownState {
  const factory _CountdownStateCancelled(final Duration duration) =
      _$_CountdownStateCancelled;

  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_CountdownStateCancelledCopyWith<_$_CountdownStateCancelled>
      get copyWith => throw _privateConstructorUsedError;
}
