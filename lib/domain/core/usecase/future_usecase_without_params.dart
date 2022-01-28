import 'dart:developer';

import 'package:fpdart/fpdart.dart';

import '../unions/failure.dart';

abstract class FutureUseCaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call() async {
    try {
      return await execute();
    } catch (e) {
      if (e is TypeError) {
        log(
          e.toString(),
          stackTrace: e.stackTrace,
        );
      } else if (e is NoSuchMethodError) {
        log(e.toString(), stackTrace: e.stackTrace);
      } else {
        log(e.toString());
      }
      return Left(Failure.getException(e));
    }
  }

  Future<Either<Failure, Type>> execute();
}
