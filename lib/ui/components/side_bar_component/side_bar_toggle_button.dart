import 'package:flutter/material.dart';

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

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
      alignment: const Alignment(0, -0.9),
      child: ClipPath(
        clipper: CustomMenuClipper(),
        child: Container(
          color: Colors.white,
          height: 110,
          width: 35,
          child: IconButton(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => toggle(),
            icon: Icon(
              isOpen ? Icons.chevron_left_sharp : Icons.chevron_right_sharp,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
