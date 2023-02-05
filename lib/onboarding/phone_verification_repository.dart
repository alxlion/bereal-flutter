import 'package:bereal/onboarding/phone_verification_exception.dart';

abstract class BasePhoneVerificationRepository {
  Future<bool> verifyNumber(String number);
}

class PhoneVerificationRepository implements BasePhoneVerificationRepository {
  @override
  Future<bool> verifyNumber(String number) {
    if (number == "123456") {
      return Future.delayed(const Duration(milliseconds: 2000), () => true);
    } else {
      throw PhoneVerificationException(PhoneVerificationExceptionEnum.invalidVerificationCode);
    }
  }
}
