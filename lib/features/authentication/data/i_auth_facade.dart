import 'package:dartz/dartz.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class IAuthFacade {
  Stream<Either<MainFailure, String>> verifyPhoneNumber(String phoneNumber);
  FutureResult<String> verifySmsCode({
    required String smsCode,
    required String verificationId,
  });
}
