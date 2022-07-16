import 'package:flutter/material.dart';
import 'package:lng/config/palette.dart';

/// Widget shown at bottom of screen when marker is selected on map.
class MarkerSelected extends StatelessWidget {
  final Function clearSelected;
  final int numSelected;
  const MarkerSelected(
      {Key? key, required this.clearSelected, required this.numSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height - 100;

    return Positioned(
      bottom: 50,
      top: height,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              // offset: Offset(0, 3),
            ),
          ],
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: Row(
            children: [
              Text('$numSelected tasks selected',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 7,
              ),
              InkWell(
                child: const Icon(
                  Icons.close,
                  size: 15,
                  color: Colors.white,
                ),
                onTap: () => clearSelected(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
