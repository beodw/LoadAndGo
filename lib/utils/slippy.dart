import 'dart:math';

int lon2tile(lon, zoom) {
  return ((lon + 180) / 360 * pow(2, zoom)).floor();
}

int lat2tile(lat, zoom) {
  return ((1 - log(tan(lat * pi / 180) + 1 / cos(lat * pi / 180)) / pi) /
          2 *
          pow(2, zoom))
      .floor();
}
