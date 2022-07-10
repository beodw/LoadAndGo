import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'ui/layouts/web_layout/base_web_layout.dart';
import 'ui/layouts/mobile_layout/base_mobile_layout.dart';
import 'config/app_settings.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugModeSetting,
      title: 'Load and Go',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: kIsWeb ? BaseWebLayout() : BaseMobileLayout(),
      ),
    );
  }
}
