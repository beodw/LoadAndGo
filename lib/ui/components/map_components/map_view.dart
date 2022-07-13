import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart';
import 'package:lng/cubit/operational_flow_cubit.dart';
import 'package:lng/cubit/orders_cubit.dart';
import 'package:lng/ui/components/map_components/marker_selected.dart';

import '../../../config/palette.dart';
import '../../../models/Orders/order.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  double initLat = 1.3521;
  double initLon = 103.8198;
  int numSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
        builder: (ordersCubitContext, ordersState) {
      return BlocBuilder<OperationalFlowCubit, OperationalFlowState>(
        builder: (operationalFlowCubitContext, operationalFlowState) {
          if (ordersState.orders.isNotEmpty) {
            initLat = ordersState.orders.first.lat;
            initLon = ordersState.orders.first.lon;
          }
          return Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                FlutterMap(
                  options: MapOptions(
                    center: LatLng(initLat, initLon),
                    zoom: 12.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png",
                    ),
                    if (ordersState.orders.isNotEmpty)
                      MarkerLayerOptions(
                        markers: [
                          for (Order order in ordersState.orders)
                            if (order.operationalFlow ==
                                operationalFlowState.selectedOperationalFlow)
                              Marker(
                                point: LatLng(order.lat, order.lon),
                                width: 30,
                                height: 30,
                                builder: (context) => IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (order.isSelected) {
                                        numSelected -= 1;
                                      } else {
                                        numSelected += 1;
                                      }
                                    });
                                    context
                                        .read<OrdersCubit>()
                                        .toggleSelectedOrder(order.id);
                                  },
                                  icon: Icon(
                                    Icons.location_on_sharp,
                                    color: order.isSelected
                                        ? secondaryColor
                                        : order.stage == 'to_warehouse'
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
                if (ordersState.numSelected > 0)
                  MarkerSelected(
                    numSelected: ordersState.numSelected,
                    clearSelected: () {
                      context.read<OrdersCubit>().clearSelected();
                      // setState(() {
                      //   numSelected = 0;
                      // });
                    },
                  )
              ],
            ),
          );
        },
      );
    });
  }
}
