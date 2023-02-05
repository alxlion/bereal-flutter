enum PhoneVerificationExceptionEnum { invalidVerificationCode, tooManyRequests }

class PhoneVerificationException implements Exception {
  final PhoneVerificationExceptionEnum status;

  PhoneVerificationException(this.status);
}
