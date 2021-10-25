import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/base/usecase/future_usecase.dart';
import '../../core/unions/failure.dart';
import '../../domain/entities/login/login.dart';
import '../../domain/repositories/my_repository.dart';

class UpdateProfileUseCaseParams extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final File? imageFile;

  const UpdateProfileUseCaseParams({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.imageFile,
  });

  @override
  List<Object?> get props => [name, email, phoneNumber, password, imageFile];
}

@lazySingleton
class UpdateProfileUseCase
    extends FutureUseCase<Login, UpdateProfileUseCaseParams> {
  final MyRepository myRepository;

  UpdateProfileUseCase({required this.myRepository});

  @override
  Future<Either<Failure, Login>> execute(UpdateProfileUseCaseParams params) {
    return myRepository.updateProfile(params);
  }
}
