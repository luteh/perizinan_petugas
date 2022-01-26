class Endpoint {
  const Endpoint._();

  static const monitoringList = '/monitoring/list';
  static permitDetail(int id) => '/monitoring/$id/detail-izin';
  static customerDetail(int id) => '/monitoring/$id/detail-customer';
}
