import 'package:flutter/material.dart';

class DialogBG extends StatelessWidget {
  final Widget dialog;
  final Function onTap;
  const DialogBG({Key? key, required this.dialog, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
        ),
        child: dialog,
      ),
    );
  }
}
