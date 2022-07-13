import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/Orders/order.dart';

class OrderRepo {
  ///Function to get orders returns a List of Order objects
  Future<List<Order>> fetchOrders() async {
    //Load data from dummy_data.json file.
    //@todo create backend with firebase so orders can be loaded in batches from database.
    dynamic data = await rootBundle.loadString('dummy_data.json');
    data = jsonDecode(data);

    //create map corresponding to loaded json data
    Map<String, dynamic> orders = data['orders'];

    //Generate a list of order objects from map
    List<Order> result = [];
    for (String key in orders.keys) {
      Order order = Order(
        id: key,
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
