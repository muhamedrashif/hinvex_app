import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hinvex_app/features/authentication/data/i_auth_facade.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class IAuthImpl implements IAuthFacade {
  IAuthImpl(this._firebaseAuth, this._firestore, this._messaging);
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final FirebaseMessaging _messaging;

  @override
  Stream<Either<MainFailure, String>> verifyPhoneNumber(
    String phoneNumber,
  ) async* {
    final StreamController<Either<MainFailure, String>> controller =
        StreamController<Either<MainFailure, String>>();

    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (err) {
        controller.add(left(MainFailure.serverFailure(errorMsg: err.code)));
      },
      codeSent: (verificationId, forceResendingToken) {
        //verification id is stored in the state

        controller.add(right(verificationId));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );

    yield* controller.stream;
  }

  @override
  FutureResult<String> verifySmsCode({
    required String smsCode,
    required String verificationId,
  }) async {
    // log('$smsCode, $verificationId');
    try {
      final PhoneAuthCredential phoneAuthCredential =
          PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);

      await _saveUser(
        phoneNo: userCredential.user!.phoneNumber!,
        uid: userCredential.user!.uid,
      );

      return right(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.code));
    }
  }

  Future<void> _saveUser({
    required String uid,
    required String phoneNo,
  }) async {
    final user = await _firestore.collection('users').doc(uid).get();

    final token = await _messaging.getToken();

    if (user.data() != null) {
      await _firestore.collection('users').doc(uid).update({
        'notificationToken': token,
      });
      return;
    } else {
      await _firestore.collection('users').doc(uid).set(UserModel().copyWith(
            userPhoneNumber: phoneNo,
            notificationToken: token,
            id: uid,
            startedDate: Timestamp.now(),
            userId: uid,
            totalPosts: 0,
            userWhatsAppNumber: phoneNo,
            favoriteProducts: [],
          ).toJson());
    }
  }

  @override
  Stream<UserModel?> fetchUser() async* {
    final userId = _firebaseAuth.currentUser?.uid;

    if (userId == null) return;
    final snapshot = _firestore.collection('users').doc(userId).snapshots();
    yield* snapshot.map((doc) {
      if (doc.exists) {
        return UserModel.fromMap(doc.data()!).copyWith(id: doc.id);
      } else {
        return null;
      }
    });
  }

  @override
  FutureResult<Unit> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return right(unit);
    } on Exception catch (e) {
      return left(
        MainFailure.userAuthenticatorError(errorMsg: '$e'),
      );
    }
  }
}
