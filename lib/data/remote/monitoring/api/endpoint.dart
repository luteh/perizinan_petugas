class Endpoint {
  const Endpoint._();

  static const monitoringList = '/monitoring/list';
  static const submitMonitoringResult = '/monitoring';
  static permitDetail(int id) => '/monitoring/$id/detail-izin';
  static customerDetail(int id) => '/monitoring/$id/detail-customer';
  static monitoringResultDetail(int submissionId) =>
      '/monitoring/$submissionId/detail-hasil-monitoring';
}
