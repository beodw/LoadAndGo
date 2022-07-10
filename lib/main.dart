import 'package:flutter/material.dart';
import 'config/app_settings.dart';
import 'ui/layouts/web_layout/base_web_layout.dart';

void main() {
  runApp(const LnG());
}

class LnG extends StatelessWidget {
  const LnG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugModeSetting,
      title: 'LnG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: BaseWebLayout(),
      ),
    );
  }
}
