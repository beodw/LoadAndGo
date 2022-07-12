import 'package:flutter/material.dart';

class PagesMap {
  ///base url for web app
  static String baseUrl = 'https://load_and_go';

  /// pages
  static Map<String, Map> pages = {
    'Dashboard': {
      'icon': Icons.dashboard_outlined,
      'selected_icon': Icons.dashboard,
      'url': baseUrl + '/dashboard'
    },
    'Assigned Orders': {
      'icon': Icons.format_shapes,
      'selected_icon': Icons.dashboard_outlined,
      'url': baseUrl + '/assigned_orders'
    },
    'Teams': {'icon': Icons.people_outlined, 'url': baseUrl + '/teams'},
    'Fleet': {'icon': Icons.local_shipping_sharp, 'url': baseUrl + '/fleet'},
    'Merchants': {
      'icon': Icons.storefront_sharp,
      'url': baseUrl + '/merchants'
    },
    'Orders': {'icon': Icons.pin_drop_sharp, 'url': baseUrl + '/'},
  };

  static List<String> getRoutes() {
    return [
      for (String page in PagesMap.pages.keys) PagesMap.pages[page]!['url']
    ];
  }

  static List<String> getTitles() {
    List<String> titles = [];
    pages.forEach((key, value) => titles.add(key));
    return titles;
  }
}
