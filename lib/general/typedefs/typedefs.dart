import 'package:dartz/dartz.dart';
import 'package:hinvex_app/general/failures/failures.dart';

typedef FutureResult<T> = Future<Either<MainFailure, T>>;
