part of 'onboarding_providers.dart';

class PhoneVerificationController extends StateNotifier<PhoneVerificationState> {
  PhoneVerificationController(this.ref) : super(const PhoneVerificationState.initial());

  Ref ref;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    state = const PhoneVerificationState.loading();

    try {
      await ref.read(phoneVerificationService).verifyPhoneNumber(phoneNumber);

      state = const PhoneVerificationState.valid();
    } on PhoneVerificationException catch (e) {
      state = PhoneVerificationState.error(e);
    }
  }
}
