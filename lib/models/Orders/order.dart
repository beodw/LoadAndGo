class Order {
  String merchant;
  final double lat;
  final double lon;
  String operationalFlow; // corresponds to 1 of the 3 operational flows
  String stage; // To Warehouse, To Delivery, To Dispatch,
  String address;
  List? assignedDrivers;
  List? assignedTeams;
  String id;
  bool isSelected;

  /// Model class to hold order data.
  Order({
    required this.merchant,
    required this.lat,
    required this.lon,
    required this.operationalFlow,
    required this.stage,
    required this.address,
    required this.id,
    this.assignedDrivers,
    this.assignedTeams,
    this.isSelected = false,
  });
}
