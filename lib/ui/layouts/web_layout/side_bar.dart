import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: AnimatedContainer(
          width: 200,
          color: Colors.blueAccent,
          duration: const Duration(seconds: 2),
          child: const Text('sidebar'),
        ),
      ),
    ]);
  }
}
