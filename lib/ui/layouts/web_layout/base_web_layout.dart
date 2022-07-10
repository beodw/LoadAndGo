import 'package:flutter/material.dart';
import 'side_bar.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart'; // Recommended for most use-cases
import 'dart:math';

class BaseWebLayout extends StatelessWidget {
  const BaseWebLayout({Key? key}) : super(key: key);

  int lon2tile(lon, zoom) {
    return ((lon + 180) / 360 * pow(2, zoom)).floor();
  }

  int lat2tile(lat, zoom) {
    return ((1 - log(tan(lat * pi / 180) + 1 / cos(lat * pi / 180)) / pi) /
            2 *
            pow(2, zoom))
        .floor();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.centerStart,
      children: [
        Positioned.fill(
          key: const Key('0'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(1.289440, 103.849980),
                    zoom: 12.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png",
                    ),
                    MarkerLayerOptions(
                      markers: [
                        Marker(
                          point: LatLng(1.289440, 103.849980),
                          width: 40,
                          height: 40,
                          builder: (context) => const Icon(
                            Icons.location_on_sharp,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                        Marker(
                          point: LatLng(1.3311606377711733, 103.7033139540567),
                          width: 40,
                          height: 40,
                          builder: (context) => const Icon(
                            Icons.location_on_sharp,
                            color: Colors.red,
                            size: 40.0,
                          ),
                        ),
                        Marker(
                          point: LatLng(1.386774284868601, 103.76644590710862),
                          width: 80,
                          height: 80,
                          builder: (context) => const Icon(
                            Icons.location_on_sharp,
                            color: Colors.purple,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Text('Right Hand Controls'),
            ],
          ),
        ),
        // const SideBar(),
      ],
    );
  }
}
