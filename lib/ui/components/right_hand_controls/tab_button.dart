import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;
  final bool selected;
  final void Function() onPressed;
  const TabButton(
      {Key? key,
      required this.text,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: selected ? FontWeight.bold : FontWeight.normal),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? Colors.black : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
