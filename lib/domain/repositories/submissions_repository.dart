import 'package:fpdart/fpdart.dart';

import '../core/unions/failure.dart';
import '../entities/submissions/submission_status_entity.dart';

abstract class SubmissionsRepository {
  Future<Either<Failure, List<SubmissionStatusEntity>>>
      fetchSubmissionStatuses();

  Future<Either<Failure, List<SubmissionStatusEntity>>>
      fetchSubmissionStatusesLocal();
}
