import 'package:flutter/material.dart';
import 'package:lng/config/palette.dart';

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
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: Row(
            children: [
              Text('$numSelected tasks selected',
                  style: const TextStyle(
                    color: Colors.white,
                  )),
              InkWell(
                child: const Icon(
                  Icons.close,
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
