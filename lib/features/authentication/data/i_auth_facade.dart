import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class IAuthFacade {
  Stream<Either<MainFailure, String>> verifyPhoneNumber(String phoneNumber);
  FutureResult<String> verifySmsCode({
    required String smsCode,
    required String verificationId,
  }) {
    throw UnimplementedError('verifyPhoneNumber() is not implemented, ');
  }

  Stream<UserModel?> fetchUser() {
    throw UnimplementedError('fetchUser() is not implemented ');
  }

  FutureResult<Unit> signOut() {
    throw UnimplementedError('signOut() is not implemented ');
  }
}
