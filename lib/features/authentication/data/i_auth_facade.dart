import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';

abstract class IAuthFacade {
  Stream<Either<MainFailure, String>> verifyPhoneNumber(String phoneNumber);
  FutureResult<String> verifySmsCode({
    required String smsCode,
    required String verificationId,
  });

  // Stream<QuerySnapshot<UserModel>> fetchUser() {
  //   throw UnimplementedError('fetchUser() not impl');
  // }

  // Future<UserModel?> getUser();
  Stream<UserModel?> fetchUser();
}
