import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'ui/layouts/web_layout/base_web_layout.dart';
import 'ui/layouts/mobile_layout/base_mobile_layout.dart';
import 'config/app_settings.dart';
import 'config/palette.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugModeSetting,
      title: 'Load and Go',
      theme: appTheme,
      home: Scaffold(
        drawer: Drawer(
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Text('s');
              }),
        ),
        body: kIsWeb ? BaseWebLayout() : BaseMobileLayout(),
      ),
    );
  }
}
