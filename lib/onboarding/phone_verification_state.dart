import 'package:bereal/onboarding/phone_verification_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_verification_state.freezed.dart';

extension PhoneVerificationGetters on PhoneVerificationState {
  bool get isLoading => this is _PhoneVerificationStateLoading;
  bool get isValid => this is _PhoneVerificationStateData;
  bool get hasError => this is _PhoneVerificationStateError;
}

@freezed
class PhoneVerificationState with _$PhoneVerificationState {
  const factory PhoneVerificationState.initial() = _PhoneVerificationStateInitial;
  const factory PhoneVerificationState.loading() = _PhoneVerificationStateLoading;
  const factory PhoneVerificationState.valid() = _PhoneVerificationStateData;
  const factory PhoneVerificationState.error(PhoneVerificationException exception) = _PhoneVerificationStateError;
}
