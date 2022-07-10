import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Order {
  String merchant;
  final double lat;
  final double lon;
  String operationalFlow; // corresponds to 1 of the 3 operational flows
  String stage; // To Warehouse, To Delivery, To Dispatch,
  String address;
  List? assignedDrivers;
  List? assignedTeams;

  /// Model class to hold order data.
  Order({
    required this.merchant,
    required this.lat,
    required this.lon,
    required this.operationalFlow,
    required this.stage,
    required this.address,
    this.assignedDrivers,
    this.assignedTeams,
  });

  /// Function to get orders. Fetches Json and returns a list of order objects.
  static Future<List<Order>> fetchOrders() async {
    dynamic data = await rootBundle.loadString('dummy_data.json');
    data = jsonDecode(data);
    Map<String, dynamic> orders = data['orders'];
    List<Order> result = [];
    for (String key in orders.keys) {
      Order order = Order(
        address: orders[key]['address'],
        lat: orders[key]['lat'],
        lon: orders[key]['lon'],
        merchant: orders[key]['merchant'],
        stage: orders[key]['stage'],
        operationalFlow: orders[key]['operationalFlow'],
      );
      if (orders[key].containsKey('assignedDrivers')) {
        order.assignedDrivers = orders[key]['assignedDrivers'];
      }
      if (orders[key].containsKey('assignedTeams')) {
        order.assignedDrivers = orders[key]['assignedTeams'];
      }
      result.add(order);
    }
    return result;
  }
}
