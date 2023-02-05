import 'package:bereal/onboarding/phone_verification_repository.dart';

class PhoneVerificationService {
  PhoneVerificationService({required this.phoneVerificationRepository});

  final BasePhoneVerificationRepository phoneVerificationRepository;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await phoneVerificationRepository.verifyNumber(phoneNumber);
  }
}
