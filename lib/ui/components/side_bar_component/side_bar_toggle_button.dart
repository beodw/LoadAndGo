import 'package:flutter/material.dart';
import '../../../config/palette.dart';

// ignore: must_be_immutable
class SideBarToggleButton extends StatelessWidget {
  final Function toggle;
  bool isOpen;
  double sideBarFraction;
  SideBarToggleButton(
      {Key? key,
      required this.toggle,
      required this.isOpen,
      required this.sideBarFraction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.87),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.75),
          borderRadius: defaultRadius,
        ),
        child: IconButton(
          onPressed: () {
            toggle();
          },
          icon: Icon(
            isOpen ? Icons.chevron_left_sharp : Icons.chevron_right_sharp,
          ),
        ),
      ),
    );
  }
}
