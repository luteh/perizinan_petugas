import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/unions/failure.dart';
import '../../core/usecase/future_usecase_without_params.dart';
import '../../entities/submissions/submission_status_entity.dart';
import '../../repositories/submissions_repository.dart';

@lazySingleton
class FetchSubmissionStatusesLocalUseCase
    extends FutureUseCaseWithoutParams<List<SubmissionStatusEntity>> {
  final SubmissionsRepository submissionRepository;

  FetchSubmissionStatusesLocalUseCase({required this.submissionRepository});

  @override
  Future<Either<Failure, List<SubmissionStatusEntity>>> execute() {
    return submissionRepository.fetchSubmissionStatusesLocal();
  }
}
