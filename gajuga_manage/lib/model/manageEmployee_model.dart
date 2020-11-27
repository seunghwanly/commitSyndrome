class Activity {
  final String orderNumber;
  final DateTime approvalTime;

  Activity({this.orderNumber, this.approvalTime});

  Map toJson() => {'orderNumber': orderNumber, 'approvalTime': approvalTime};
}
