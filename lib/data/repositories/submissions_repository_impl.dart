import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/unions/failure.dart';
import '../../domain/entities/submissions/submission_status_entity.dart';
import '../../domain/repositories/submissions_repository.dart';
import '../local/submissions/submissions_local_data_source.dart';
import '../remote/submissions/submissions_remote_data_source.dart';

@LazySingleton(as: SubmissionsRepository)
class SubmissionsRepositoryImpl implements SubmissionsRepository {
  final SubmissionsRemoteDataSource _remoteDataSource;
  final SubmissionsLocalDataSource _localDataSource;

  SubmissionsRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<SubmissionStatusEntity>>>
      fetchSubmissionStatuses() async {
    final _response = await _remoteDataSource.fetchSubmissionStatuses();
    await _localDataSource.saveSubmissionStatuses(
        _response.data.map((e) => e.toLocal()).toList());
    return Right(_response.data.map((e) => e.toDomain()).toList());
  }

  @override
  Future<Either<Failure, List<SubmissionStatusEntity>>>
      fetchSubmissionStatusesLocal() async {
    return Right(_localDataSource
            .getSubmissionStatuses()
            .map((e) => e.toDomain())
            .toList());
  }
}
