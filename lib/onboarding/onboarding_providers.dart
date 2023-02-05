import 'package:bereal/onboarding/phone_verification_service.dart';
import 'package:bereal/onboarding/phone_verification_exception.dart';
import 'package:bereal/onboarding/phone_verification_repository.dart';
import 'package:bereal/onboarding/phone_verification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'phone_verification_controller.dart';

final phoneVerificationService = Provider<PhoneVerificationService>((ref) {
  return PhoneVerificationService(
    phoneVerificationRepository: ref.watch(phoneVerificationRepositoryProvider),
  );
});

final phoneVerificationProvider = StateNotifierProvider<PhoneVerificationController, PhoneVerificationState>(
    (ref) => PhoneVerificationController(ref));

final phoneVerificationRepositoryProvider =
    Provider<BasePhoneVerificationRepository>((ref) => PhoneVerificationRepository());
