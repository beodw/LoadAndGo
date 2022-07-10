import 'package:flutter/material.dart';
import 'dart:async';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isOpen = false;
  double sideBarWidth = 200;

  Timer newTimer() {
    return Timer(const Duration(seconds: 2), () {
      setState(() {
        sideBarWidth = 200;
      });
    });
  }

  @override
  void initState() {
    Timer timer = newTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: MediaQuery.of(context).size.height,
      width: sideBarWidth,
      color: Colors.white.withOpacity(0.2),
      child: Column(children: [
        Row(
          children: [
            Text('logo'),
            // SizedBox(
            //   width: sideBarWidth,
            // ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.chevron_right,
                size: 18,
              ),
              shape: CircleBorder(),
            ),
          ],
        ),
      ]),
    );
  }
}
