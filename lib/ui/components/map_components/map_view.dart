import "package:flutter/material.dart";
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart';

import '../../../models/Orders/order.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  String selectedOperationalFlow = 'pick_up_dispatch_and_delivery';
  List<Order> orders = [];
  double initLat = 0.0;
  double initLon = 0.0;

  // Get orders from service
  Future<void> genOrders() async {
    List<Order> result = await Order.fetchOrders();
    setState(() {
      orders = result;
    });
  }

  @override
  void initState() {
    genOrders();
    super.initState();
  }

  @override
  void dispose() {
    orders = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initLat = orders.isEmpty ? 1.3521 : orders.first.lat;
    initLon = orders.isEmpty ? 103.8198 : orders.first.lon;
    return Expanded(
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(initLat, initLon),
          zoom: 12.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png",
          ),
          if (orders.isNotEmpty)
            MarkerLayerOptions(
              markers: [
                for (Order order in orders)
                  // if (order.operationalFlow == selectedOperationalFlow)
                  Marker(
                    point: LatLng(order.lat, order.lon),
                    width: 30,
                    height: 30,
                    builder: (context) => IconButton(
                      onPressed: () async {},
                      icon: Icon(
                        Icons.location_on_sharp,
                        color: order.stage == 'to_warehouse'
                            ? Colors.blue
                            : order.stage == 'to_delivery'
                                ? Colors.green
                                : Colors.purple,
                        size: 30.0,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
