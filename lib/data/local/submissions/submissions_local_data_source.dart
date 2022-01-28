import 'package:injectable/injectable.dart';

import 'hive/submissions_hive_manager.dart';
import 'model/submission_status_local.dart';

@lazySingleton
class SubmissionsLocalDataSource {
  final SubmissionsHiveManager _hiveManager;

  SubmissionsLocalDataSource(this._hiveManager);

  Future<void> saveSubmissionStatuses(
      List<SubmissionStatusLocal>? submissionStatuses) async {
    await _hiveManager.saveSubmissionStatuses(submissionStatuses);
  }

  Future<void> deleteSubmissionStatuses() async {
    await _hiveManager.deleteSubmissionStatuses();
  }

  List<SubmissionStatusLocal> getSubmissionStatuses() {
    final _datas = _hiveManager.getSubmissionStatuses();
    return _datas.map((e) => e as SubmissionStatusLocal).toList();
  }
}
