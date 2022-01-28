import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../hive/hive_key.dart';
import '../model/submission_status_local.dart';

@lazySingleton
class SubmissionsHiveManager {
  final Box<dynamic> _box;

  SubmissionsHiveManager(this._box);

  Future<void> saveSubmissionStatuses(
      List<SubmissionStatusLocal>? submissionStatuses) async {
    await _box.put(HiveKey.submissionStatuses, submissionStatuses);
  }

  Future<void> deleteSubmissionStatuses() async {
    await _box.delete(HiveKey.submissionStatuses);
  }

  List<dynamic> getSubmissionStatuses() {
    return _box.get(HiveKey.submissionStatuses, defaultValue: []);
  }
}
